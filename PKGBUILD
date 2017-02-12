# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-02-12.

_pkgname=openflights-data
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=latest
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Airport, train station, ferry terminal, airline and flight routes data as CSV files to be used e.g. in GIS-applications."
arch=(any)
url="http://openflights.org/data.html"
license=(
  'custom:Open Database License (ODbL) 1.0'
  'custom:Database Contents License (DbCL) 1.0'
)

groups=(
        "openflights"
       )

depends=(
        )

makedepends=(
)

optdepends=(
           )

provides=(
  "${_pkgname}=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

source=(
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports-extended.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports-dafif.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airlines.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/countries.dat"
  "https://raw.githubusercontent.com/jpatokal/openflights/master/data/locales.dat"
  "info.html::http://openflights.org/data.html"
  "License_ODbL_1.0.html::http://opendatacommons.org/licenses/odbl/1.0/"
  "License_DbCL_1.0.html::http://opendatacommons.org/licenses/dbcl/1.0/"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  _instdirbase='/opt/openflights-data'
  _instdir="${pkgdir}/${_instdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _licensedirbase="/usr/share/licenses/${pkgname}"
  _licensedir="${pkgdir}/${_licensedirbase}"

  install -v -d -m755 "${_instdir}"
  install -v -m644 "${srcdir}"/*.dat "${_instdir}/"

  install -v -d -m755 "${_docdir}"
  echo "${url}" > "${_docdir}/info.url"
  chmod 644 "${_docdir}/info.url"
  install -v -D -m644 "${srcdir}/info.html" "${_docdir}/info.html"

  install -v -D -m644 "${srcdir}/License_ODbL_1.0.html" "${_licensedir}/License_ODbL_1.0.html"
  install -v -D -m644 "${srcdir}/License_DbCL_1.0.html" "${_licensedir}/License_DbCL_1.0.html"
}
