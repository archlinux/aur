# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
_pkgbase='luxtorpeda'
pkgname="${_pkgbase}-bin"
pkgver=v76.2.0
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
sha512sums=('4ddeca170e49eaf4dfe8c32c7a15755f0a23ad38b0edd5a74e3266991cf31f749a711032cd3d232ee1d8a83ef803f34327435237a539b7619d98c7ddff9f1b91')

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/share/steam/compatibilitytools.d"
  cp -r "${srcdir}/${_pkgbase}" "${pkgdir}/usr/share/steam/compatibilitytools.d/"
}
