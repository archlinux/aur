# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Víctor Granda <victorgrandagarcia at gmail dot com>

_gitname=solarized_sddm_theme
pkgname=solarized-sddm-theme
pkgver=0.3.0
pkgrel=2
pkgdesc="A solarized SDDM theme"
arch=('any')
url="https://github.com/hcartiaux/solarized_sddm_theme"
license=('GPL-3.0')

depends=('sddm>=0.21.0')
optdepends=('otf-raleway: raleway font support'
            'ttf-impallari-raleway-family: raleway font support'
            'otf-font-awesome: Fontawesome support'
            'ttf-font-awesome: Fontawesome support'
            'ttf-google-fonts-git: Open fonts from google, included raleway')
install=${pkgname}.install

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hcartiaux/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('011353a704a91edda3e61fb76a31b50ffa9acdc5d17b60ef308dcea243bfb842')

package() {
  # Installing theme
  cd ${_gitname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/sddm/themes/${pkgname}
  cp --no-preserve='ownership' -rf * "${pkgdir}"/usr/share/sddm/themes/${pkgname}
}
