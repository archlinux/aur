pkgname=ckan-bin
_pkgname=ckan
pkgver=1.36.2
buildno=25356
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}.${buildno}_all.deb")
sha256sums=('c8b855e305e8ce5813b8ca590b8c362878c2033521c1a5ad1031ac5ea0e551eb')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.zst"
  mv "usr" "${pkgdir}"
}
