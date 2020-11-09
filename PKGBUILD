# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.2
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
  x86_64)    _CARCH=amd64 && sha256sums=('37b26104c0868706bc0c24e47a41c6dcee8e3ab6bc3b41425ade8c58337246f3');;
  aarch64)   _CARCH=arm64 && sha256sums=('e66061c308985995ef358a4f11c892a65e354da4d99f45717843b9cb7db4c15e');;
  arm*)      _CARCH=arm   && sha256sums=('4843a72dd293734d6d8d4972cc829c440ae7166fb16e1ccbef21daf0becbeac1');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
