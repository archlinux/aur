# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rose-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Input method user dictionary converter"
arch=('x86_64')
url="https://github.com/nopdan/rose"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nopdan/rose/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rose_linux-x64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('4596c91cb80da032e532fccedcdec2ebf18eaf44435874234e872e56129cf5b9')

package() {
  install -Dm755 "rose" "${pkgdir}/usr/bin/rose"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
