# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.7
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e84b54da40e7e53cfd5cb3933c6aab9f027e14c39c1a0d29f90479bf3f8feeff');;
  arm*)      _CARCH=arm   && sha256sums=('6fdcad42b310b46d164764edb7fbaf16fdbbce8ed2ea5b2d56191fc5423db9e5');;
  aarch64)   _CARCH=arm64 && sha256sums=('be13b2029f614c94ec23e131619ee7e4780c2910a40c24cc41d52e18e536076d');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
