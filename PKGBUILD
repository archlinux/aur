# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0
pkgrel=3
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://github.com/phoepsilonix/numlockl'
license=('MIT')
depends=('libbsd')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha512sums=('e9d563fe285083e115268bd598d48fa3c9d1089be4f15783cb809c48b68c9d6b15badecad953aab108eddd3afc9aabb824d71d5c91857d4b98452da94686b9c7')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  mkdir -p ${pkgdir}/usr/bin
  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
