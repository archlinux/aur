# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

pkgname="ttf2png"
pkgver=2.0
pkgrel=1
pkgdesc="Create a PNG image containing a set of glyphs from a true type font"
arch=('i686' 'x86_64')
url="https://www.tdb.fi/ttf2png.shtml"
# _url="http://git.tdb.fi/?p=ttf2png.git"
license=('GPL-2.0-only')
depends=('freetype2' 'glibc' 'libpng')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://www.tdb.fi/files/${_pkgsrc}.tar.gz")
sha256sums=('ef461eade67a6a954d5787c20dabc0848ab8eaff0eab859dfdb36528d30e1ba4')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "Readme"     "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "gpl.txt"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
