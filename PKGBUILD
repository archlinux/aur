# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('154d55b3a587edc2da497f621f2b302a393cf70e332001fcd2aad612dd479a41');;
  arm*)    _CARCH=arm   && sha256sums=('e9ae183289775bc262fdf8ed35189f1aa902b61f5af0b05ca0de40cb19e9ef38');;
  aarch64) _CARCH=arm64 && sha256sums=('ff22dc39005ea36fd4b3fd132df506571d67e995535f3f29c88be869cde3e44c');;
esac

source=("https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke_linux-${_CARCH}" "${pkgdir}/usr/bin/rke"
}
