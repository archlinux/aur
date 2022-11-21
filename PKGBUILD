# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('e838e353a3f12088b3f6042dcaf023b0fc09abce80f37f5cedd35dde8271487a');;
  arm*)    _CARCH=arm   && sha256sums=('83da323759fa39383c892e181786f81750afa61d2e08b50be9cc400dc3a3f527');;
  aarch64) _CARCH=arm64 && sha256sums=('849ef1b7f19ad061c02e8b9497c0fcf6050580bb9ca762ea7405ab2909a63239');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
