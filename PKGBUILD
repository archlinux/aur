pkgname="autorestic-bin"
pkgver=1.5.7
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

sha256sums_x86_64=('53eb98b701452db5c74bdb941e6e3ae0b07ce8ace4d0c974432278b4b5b53ec3')
sha256sums_i686=('27ecc60013899b9189cce5853daed4751cb6b83af65c46dd8cdf87b5a3c016d8')
sha256sums_aarch32=('5c66577ddecd38715d573d8ad89bf1df91912df9d41bace4a5286d9d501d8aa8')
sha256sums_aarch64=('044aa7a398730361ab16817928ae279f1920277fd9632a69e2c421a60d615951')

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
