pkgname=ckan-bin
_pkgname=ckan
pkgver=1.26.4
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('aa17b73085cbaa686311eb839809bc3caaef13593d75ece771cbae3f1bd03448')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.xz"
  mv "usr" "${pkgdir}"
}
