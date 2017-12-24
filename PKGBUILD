# Maintainer: Víctor Granda <victorgrandagarcia at gmail dot com>

_gitname=solarized_sddm_theme
pkgname=solarized-sddm-theme
pkgver=0.1.7
pkgrel=1
pkgdesc="A solarized SDDM theme"
arch=('any')
url="https://github.com/MalditoBarbudo/solarized_sddm_theme"
license=('GPL')

depends=('sddm>=0.14.0')
makedepends=('git')
optdepends=('otf-raleway: raleway font support'
            'ttf-impallari-raleway-family: raleway font support'
            'otf-font-awesome: Fontawesome support'
            'ttf-font-awesome: Fontawesome support'
            'ttf-google-fonts-git: Open fonts from google, included raleway')
provides=("${pkgname}=${pkgver}")
install=${pkgname}.install

source=(
"${pkgname}"::"git://github.com/MalditoBarbudo/${_gitname}.git#tag=${pkgver}"
)
md5sums=('SKIP')

package() {
  # Installing theme
  cd ${pkgname}
  install -dm 755 "${pkgdir}"/usr/share/sddm/themes/${pkgname}
  cp --no-preserve='ownership' * "${pkgdir}"/usr/share/sddm/themes/${pkgname}
}
