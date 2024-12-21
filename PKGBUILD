# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
_pkgbase='luxtorpeda'
pkgname="${_pkgbase}-bin"
pkgver=v71.0.0
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
sha512sums=('547934acc2c80a86bfc7d048c79fbde552e58cdd96af803c5962b2d9412d7e7d16f095279c85de2646682f276d45239022ba7e2dde0ca0a40e92398297d08331')

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/share/steam/compatibilitytools.d"
  cp -r "${srcdir}/${_pkgbase}" "${pkgdir}/usr/share/steam/compatibilitytools.d/"
}
