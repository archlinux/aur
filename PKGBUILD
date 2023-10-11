# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=3.1
pkgrel=1
pkgdesc="Command line utilities for working with epub files"
arch=('x86_64')
url="https://github.com/dino-/${pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
makedepends=(stack)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dino-/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0c448ef7df752dce48e79aecc0300d6cca365a0f224b4db597388837d53c49d0')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX="../dist" ./util/install.sh
}
package() {
  cd "dist"
  install -Dm755 "usr/bin/epubzip" "${pkgdir}/usr/bin/epubzip"
  install -Dm755 "usr/bin/epubmeta" "${pkgdir}/usr/bin/epubmeta"
  install -Dm755 "usr/bin/epubname" "${pkgdir}/usr/bin/epubname"
  install -Dm644 "usr/share/doc/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "usr/share/doc/${pkgname}/changelog.md" "${pkgdir}/usr/share/doc/${pkgname}/changelog.md"
  install -Dm644 "usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
