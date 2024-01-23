# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools-bin
_pkgname=epub-tools
pkgver=3.2
pkgrel=1
pkgdesc="Command line utilities for working with epub files. Packaged upstream binaries."
arch=('x86_64')
url="https://github.com/dino-/${_pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
source=("https://github.com/dino-/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz")
sha256sums=('a8836280c84e60d0c23f9607be58799fcb9be30765b3420b30c65b34ebeab7eb')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "usr/bin/epubzip" "${pkgdir}/usr/bin/epubzip"
  install -Dm755 "usr/bin/epubmeta" "${pkgdir}/usr/bin/epubmeta"
  install -Dm755 "usr/bin/epubname" "${pkgdir}/usr/bin/epubname"
  install -Dm644 "usr/share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "usr/share/doc/${_pkgname}/changelog.md" "${pkgdir}/usr/share/doc/${_pkgname}/changelog.md"
  install -Dm644 "usr/share/licenses/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
