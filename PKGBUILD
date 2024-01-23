# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=3.2
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
sha256sums=('4a7c055d447c4e86b16f3d6ab916d89fbfcd04be52a3bb4e9c6aca768c56486a')
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
