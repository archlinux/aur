# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Víctor Granda <victorgrandagarcia at gmail dot com>

_gitname=solarized_sddm_theme
pkgname=solarized-sddm-theme
pkgver=0.1.8
pkgrel=2
pkgdesc="A solarized SDDM theme"
arch=('any')
url="https://github.com/MalditoBarbudo/solarized_sddm_theme"
license=('GPL-3.0')

depends=('sddm>=0.14.0')
optdepends=('otf-raleway: raleway font support'
            'ttf-impallari-raleway-family: raleway font support'
            'otf-font-awesome: Fontawesome support'
            'ttf-font-awesome: Fontawesome support'
            'ttf-google-fonts-git: Open fonts from google, included raleway')
install=${pkgname}.install

source=("${pkgname}"::"https://github.com/MalditoBarbudo/${_gitname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a95b662b64109fb81e1eeaea5dbe08bf89c6bd2f0493021b8069ab7ecda74760')

package() {
  # Installing theme
  cd ${_gitname}-${pkgver}
  rm -f *.qmlc
  install -dm 755 "${pkgdir}"/usr/share/sddm/themes/${pkgname}
  cp --no-preserve='ownership' * "${pkgdir}"/usr/share/sddm/themes/${pkgname}
}
