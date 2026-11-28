# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wally-package-types-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Re-export types in Wally package thunks"
arch=('x86_64' 'aarch64')
url="https://github.com/JohnnyMorganz/wally-package-types"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JohnnyMorganz/wally-package-types/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/wally-package-types-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/wally-package-types-linux-aarch64.zip")
sha256sums=('5bf374ce7ab54c8d75f14e21f04932cae10708189afaec95321aed1a47701935')
sha256sums_x86_64=('a8ce418b45a04dec8cce321a4f3583fe20b448e6c2c31c71aa453f590051911b')
sha256sums_aarch64=('2a648fafee003be39c9fb0dd9bbc44d55d48394c24acc6d31c70b092a7cec00e')

package() {
  install -Dm755 "wally-package-types" "${pkgdir}/usr/bin/wally-package-types"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
