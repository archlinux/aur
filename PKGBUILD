pkgname=ckan-bin
_pkgname=ckan
pkgver=1.25.1
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('f77fa3d6dff3dcee897072e3f507aed2b56da396da84e5f537da6ae3e9603054')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.xz"
  mv "usr" "${pkgdir}"
}
