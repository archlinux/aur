# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools-bin
_pkgname=epub-tools
pkgver=4.0
pkgrel=1
pkgdesc="Command line utilities for working with epub files. Packaged upstream binaries."
arch=('x86_64')
url="https://codeberg.org/dinofp/${_pkgname}"
license=('ISC')
provides=(epub-tools)
conflicts=(epub-tools)
depends=(glibc gmp zlib)
source=("https://codeberg.org/dinofp/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz")
sha256sums=('ded9d262722925d54339abe839ffea35a3599351455f63c761d24c41474700da')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "usr/bin/epubzip" "${pkgdir}/usr/bin/epubzip"
  install -Dm755 "usr/bin/epubmeta" "${pkgdir}/usr/bin/epubmeta"
  install -Dm755 "usr/bin/epubname" "${pkgdir}/usr/bin/epubname"
  install -Dm644 "usr/share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "usr/share/doc/${_pkgname}/changelog.md" "${pkgdir}/usr/share/doc/${_pkgname}/changelog.md"
  install -Dm644 "usr/share/licenses/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
