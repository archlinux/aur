pkgname=ckan-bin
_pkgname=ckan
pkgver=1.34.4
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('b5c02f507e2ae351ebc296b72330e1149e22bc8b45b808bd5475718d16d8afec')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.xz"
  mv "usr" "${pkgdir}"
}
