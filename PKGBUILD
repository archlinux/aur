# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools-bin
_pkgname=epub-tools
pkgver=3.1
pkgrel=1
pkgdesc="Command line utilities for working with epub files. Packaged upstream binaries."
arch=('x86_64')
url="https://github.com/dino-/${_pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
source=("https://github.com/dino-/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz")
sha256sums=('6c872d0b8455692e27a440ad422c350e60729bb0d80b0e1f2be2268d2ff9ee72')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "usr/bin/epubzip" "${pkgdir}/usr/bin/epubzip"
  install -Dm755 "usr/bin/epubmeta" "${pkgdir}/usr/bin/epubmeta"
  install -Dm755 "usr/bin/epubname" "${pkgdir}/usr/bin/epubname"
  install -Dm644 "usr/share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "usr/share/doc/${_pkgname}/changelog.md" "${pkgdir}/usr/share/doc/${_pkgname}/changelog.md"
  install -Dm644 "usr/share/licenses/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
