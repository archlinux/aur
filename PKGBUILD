pkgname=ckan-bin
_pkgname=ckan
pkgver=1.35.2
buildno=24280
pkgrel=2
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}.${buildno}_all.deb")
sha256sums=('8d8676ebeb72db068265d6118ecc95272fba004b58dc8549d987d4d82453a510')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.zst"
  mv "usr" "${pkgdir}"
}
