# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('07a7162d654c84235e06a132caff465f17c206654e7bdf10821912d1c068e7cf');;
  arm*)    _CARCH=arm   && sha256sums=('6619f1b3d1e803603cfa5657ad54da736aeaaad5202adcef3fc1cc1e6e4f71ca');;
  aarch64) _CARCH=arm64 && sha256sums=('6716f32e02dbc195f017f275d66b041ef3d8b6e878288d12412e43674a74ae7c');;
esac

source=("https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke_linux-${_CARCH}" "${pkgdir}/usr/bin/rke"
}
