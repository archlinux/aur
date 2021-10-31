pkgname="autorestic-bin"
pkgver=1.4.0
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

sha256sums_x86_64=('b92de05eaca58593b80a4b9523fed9ed3cf5a8cdf6d375f05b073ebc3ad15504')
sha256sums_i686=('9cae86f2bd08c82088d3f3b4b29e9bd5fc699eab5d13973ab044d16d8ad882be')
sha256sums_aarch32=('b259e7ff8fc4a87d99b7bbec60a97008135528f270355d4e14c8754692f2ca6a')
sha256sums_aarch64=('d14aa9218a45f2ef05ddf610b2d6520dca5d31b83ff622a7033c5bf4f705a6bb')

source_i686=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-$pkgver-$arch.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
