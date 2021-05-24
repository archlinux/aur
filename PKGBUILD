pkgname=ckan-bin
_pkgname=ckan
pkgver=1.30.2
pkgrel=1
pkgdesc='The Comprehensive Kerbal Archive Network'
arch=('any')
url="https://github.com/ksp-ckan/ckan/"
license=('MIT')
depends=('mono>=5.0.1')
provides=('ckan')
conflicts=('ckan')

source=("${_pkgname}_${pkgver}_all.deb::https://github.com/ksp-ckan/ckan/releases/download/v${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('1c08a6f26e473f276e943eb9061d7ee3becaa84fb8ebd92ce8cf89fde6f25dda')

package() {
  mkdir -p "${pkgdir}"
  ar -x "${_pkgname}_${pkgver}_all.deb"
  tar -xf "data.tar.xz"
  mv "usr" "${pkgdir}"
}
