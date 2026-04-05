# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Víctor Granda <victorgrandagarcia at gmail dot com>

_gitname=solarized_sddm_theme
pkgname=solarized-sddm-theme
pkgver=0.3.1
pkgrel=1
pkgdesc='A solarized SDDM theme'
arch=('any')
url='https://github.com/hcartiaux/solarized_sddm_theme'
license=('MIT AND GPL-3.0-only')

depends=('sddm>=0.21.0')
optdepends=('otf-raleway: raleway font support'
            'ttf-impallari-raleway-family: raleway font support'
            'otf-font-awesome: Fontawesome support'
            'ttf-font-awesome: Fontawesome support'
            'ttf-google-fonts-git: Open fonts from google, included raleway')
install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hcartiaux/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b272c6f4738ad1d1a4c6191173d9a6e89573be284c4e6d2ca97e7ea3e4c1d49a')

package() {
  # Installing theme
  cd "${_gitname}-${pkgver}"
  install -dm 755 "${pkgdir}/usr/share/sddm/themes/${pkgname}"
  cp --no-preserve='ownership' -rf ./* "${pkgdir}/usr/share/sddm/themes/${pkgname}"

  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 LICENSE.* "${pkgdir}/usr/share/licenses/${pkgname}/"
}
