# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dome-bin
pkgver=1.8.3
pkgrel=1
pkgdesc="Lightweight game development environment for the Wren language"
arch=('x86_64')
url="https://github.com/domeengine/dome"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/domeengine/dome/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/dome-v${pkgver}-linux-x64.zip")
sha256sums=('ca7a9e01151a33be374939f4639e4642193f8faffbb5f921ed902d1d4ee0a5e2')
sha256sums_x86_64=('617f95de893e1feda45458b80649c7a3af006ea3df2ae0379431245e9e926438')

package() {
  install -Dm755 "dome-linux-x64/dome" "${pkgdir}/usr/bin/dome"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
