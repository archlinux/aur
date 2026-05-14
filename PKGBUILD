pkgname=ckan-bin
_pkgname=ckan
pkgver=1.36.4
buildno=26132
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}.${buildno}_all.deb")
sha256sums=('453063c76bcc2fb87b1ac4c7fc2f8cb582453364079ff1eccffd31dc917da9c1')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.zst"
  mv "usr" "${pkgdir}"
}
