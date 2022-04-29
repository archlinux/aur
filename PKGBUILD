# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.10
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('a2172e28e0b925aee6a45d72c46f1229c8b57651063a1d46f971a06ad65c70dd');;
  arm*)    _CARCH=arm   && sha256sums=('b75eef1394daf546d41822280e86f5c932e24a9b38f74b02ba56b106b8ffbfbc');;
  aarch64) _CARCH=arm64 && sha256sums=('3287278f2845a48ffd6f9cf1d21e48868f28a091d1659f8784c9c21f999e8eef');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
