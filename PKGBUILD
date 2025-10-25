# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
_pkgbase='luxtorpeda'
pkgname="${_pkgbase}-bin"
pkgver=v74.3.0
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
sha512sums=('e6925b5a8fcf3fe5ed4c898c3dc46cb14894538cf62f995befe121a9fe1e8a7f66da4dc9523aeb432fe0880ab042e5ef5568f246a7de75d45a7a5f4ef3cdfb90')

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/share/steam/compatibilitytools.d"
  cp -r "${srcdir}/${_pkgbase}" "${pkgdir}/usr/share/steam/compatibilitytools.d/"
}
