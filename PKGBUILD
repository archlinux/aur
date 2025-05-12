pkgname=ckan-bin
_pkgname=ckan
pkgver=1.36.0
buildno=25098
pkgrel=2
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}.${buildno}_all.deb")
sha256sums=('585833184f4d35a193b4f1f1769142e26722b13f8ce4f1143587a765f0cba086')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.zst"
  mv "usr" "${pkgdir}"
}
