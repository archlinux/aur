# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.6
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
  x86_64)    _CARCH=amd64 && sha256sums=('6d4a44931cf2fddbac742b24a4172ecf41ab199eee047cb8fa598e15e45fff8c');;
  aarch64)   _CARCH=arm64 && sha256sums=('f5b209a20db043aa2ca640b9ed08dc60be4580ca5b9d5de85e17953c0d12c2b1');;
  arm*)      _CARCH=arm   && sha256sums=('399abd6eeebe559f056cbb37a2556f95c035ab6c9d5e5b2ed8f90493487f66af');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
