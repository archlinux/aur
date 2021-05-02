pkgname="autorestic-bin"
pkgver=1.0.9
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
_arch_aarch32="arm"
_arch_aarch64="arm64"

sha256sums_i686=('095a6744f9492ce8e130e690c5e94137e3cddb861e06fb869e4ad6d533caacb6')
sha256sums_x86_64=('76c4023af2174259cc474f1d7d2e0db6923013776360fb5a4f8c8cf9384fa814')
sha256sums_aarch64=('8a050060ae723526ddff945e7572111885391467c2cf4235811fd2389874ceb4')
sha256sums_aarch32=('a3ea114cd56f4e297bdb5da3543592cf8860786a309e9a26b63698b992ccc828')

source_i686=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-$pkgver.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
