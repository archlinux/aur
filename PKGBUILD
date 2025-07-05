# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
_pkgbase='luxtorpeda'
pkgname="${_pkgbase}-bin"
pkgver=v73.0.1
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64')
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL2')
depends=()
optdepends=('steam: The Steam client')
provides=("${pkgname}" "${_pkgbase}")
conflicts=("${pkgname}" "${_pkgbase}" "${_pkgbase}-git")
source=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.xz")
sha512sums=('da26cdb7ab1584afc7058db51dfc7c3174a52cac26d2a6ae19aca2d1008337dafb2a72265976b8830655aa730a248e5a6aba48da72a6d01b7ebfeafaf0388ca4')

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/share/steam/compatibilitytools.d"
  cp -r "${srcdir}/${_pkgbase}" "${pkgdir}/usr/share/steam/compatibilitytools.d/"
}
