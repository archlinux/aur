# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=4.0
pkgrel=1
pkgdesc="Command line utilities for working with epub files"
arch=('x86_64')
url="https://codeberg.org/dinofp/${pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
makedepends=(stack)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dinofp/${pkgname}/archive/4.0.tar.gz")
sha256sums=('210791e8837287f889ff7eaf6426925760aeac17c02459810001441f0ff5e845')
build() {
  cd "${srcdir}/${pkgname}"
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
