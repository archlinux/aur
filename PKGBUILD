# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
_pkgbase='luxtorpeda'
pkgname="${_pkgbase}-bin"
pkgver=v75.0.0
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
sha512sums=('bfe9091deeb12fea2343c70459cca98a94ffac036487158530cf9a85a3ee8534a333cc7b41398650dff2afbce082de6460857cdafa2e5a364936a8f6a642264c')

package() {
  cd "${srcdir}/${_pkgbase}"
  mkdir -p "${pkgdir}/usr/share/steam/compatibilitytools.d"
  cp -r "${srcdir}/${_pkgbase}" "${pkgdir}/usr/share/steam/compatibilitytools.d/"
}
