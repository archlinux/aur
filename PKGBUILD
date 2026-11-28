# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dictu-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="High-level, dynamically typed, multi-paradigm programming language"
arch=('x86_64')
url="https://github.com/dictu-lang/Dictu"
license=('MIT')
depends=('curl' 'glibc' 'util-linux-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dictu-lang/Dictu/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dictu-linux-x86_64")
sha256sums=('1e11be27805574d5c12c4a730c6fe2228e46e556f4f00f6a63dd4ede33e226a9')
sha256sums_x86_64=('f0d91732b24e445395bf2acf43fda6d8021e9af6154fa77ab4ac1c9e7b43bd8b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dictu"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
