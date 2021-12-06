pkgname="autorestic-bin"
pkgver=1.5.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('x86_64' 'i686' 'aarch32' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

_arch_i686="386"
_arch_x86_64="amd64"
_arch_aarch64="arm64"
_arch_aarch32="arm"

sha256sums_x86_64=('98adc42f425a8e82507987f58025f9775205d09dfe42557c926e92a8faf2d2df')
sha256sums_i686=('cbf583463decf9910af838e91e97334fcdd838e7301caa020855aa29f825b146')
sha256sums_aarch32=('b0321d3f629c612cbc32748495be2a5dc5c1fccb0ba760e709f873dc333ed830')
sha256sums_aarch64=('9998db1cb5b8b3bb3ca576b1b9c574eed4dfac05625acc9dfee7da25b413cdc0')

source_i686=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-${pkgver}-$arch.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
