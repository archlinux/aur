# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.7
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('ebc62233f213762ef9686ac9029638f646269d17843ed7b0e4dbd9df5921b855');;
  aarch64)   _CARCH=arm64 && sha256sums=('2047635da3f55598cdf9c6b6793ec3e822eb13b60c888b417c3a3ced83c07c0f');;
  arm*)      _CARCH=arm   && sha256sums=('08ce8908964ce7aeeea8760d0a27358212c2b53990f0ee8a2c9b7544d5eacb6e');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
