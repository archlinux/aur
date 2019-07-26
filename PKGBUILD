# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-12-17.

_pkgname=idos-timetable-lang-en
pkgname="${_pkgname}"
epoch=0
pkgver=20160720
pkgrel=6
pkgdesc="English language ressource file for railway/ public transport timetable search engines by CHAPS."
arch=(any)
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-browser"
        )
makedepends=()
optdepends=()
provides=(
  "idos-timetable-lang=${pkgver}"
)
replaces=()
conflicts=()

source=(
  "TTe.dll"
  "copying.info.txt"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "version"
)

sha256sums=(
  'eb8f3408e057fb406d1c9fc1a5be7fa57657c8a23bfb6a73c6e5b1931a722fb9'
  'c34696bef1fd70999b1dedcb3dbb061f9ace8a2f90c7a5fd11f256324d557cb2'
  'SKIP'
  'SKIP'
)

pkgver() {
  cat "${srcdir}/version" | grep -E -v '^[[:space:]]*#' | head -n 1 | tr -d '\n'
}

package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -D -m644 "${srcdir}/TTe.dll"                  "${_instdir}/TTe.dll"
  install -D -m644 "${srcdir}/copying.info.txt"         "${pkgdir}/usr/share/licenses/${pkgname}/copying.info.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf"         "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
