# Maintainer:  dreieck

_pkgname=unison
_pkgver=2.48.4
pkgname="${_pkgname}-${_pkgver}"
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="Makes the specific version ${_pkgver} of ${_pkgname} available as default ${_pkgname}."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'any'
)
license=('GPL-3.0-or-later')
depends=(
  "${_pkgname}-${_pkgver}-compat"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

package() {

  install -dm755 "${pkgdir}"/usr/bin
  cd "${pkgdir}"/usr/bin
  ln -s "unison-${_pkgver}" "unison"

  install -dm755 "${pkgdir}"/usr/share/doc
  cd "${pkgdir}"/usr/share/doc
  ln -s unison-2.48.4 unison

  install -dm755 "${pkgdir}"/usr/share/man/man1
  cd "${pkgdir}"/usr/share/man/man1
  ln -s unison-2.48.4.1.gz unison.1.gz
}
