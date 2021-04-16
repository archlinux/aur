# Maintainer: dreieck

_pkgname="gitlog-to-changelog"
pkgname="${_pkgname}-git"
pkgdesc="Convert git log output to ChangeLog format."
url="https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/gitlog-to-changelog"
license=("GPL3")
epoch=0
pkgver=20210224T2342
pkgrel=1
arch=(
  'any'
)
depends=(
  'perl'
)
makedepends=(
  'curl'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
optdepends=(
)
source=(
  "${_pkgname}::https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/gitlog-to-changelog"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}"
  perl "./${_pkgname}" --version | awk '{print $3"T"$4}' | tr -d ':-'
}

package() {
  cd "${srcdir}"
  install -D -m755 -v "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
