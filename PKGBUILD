# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_gemname=crass
pkgname=ruby-${_gemname}
pkgver=1.0.2
pkgrel=1
pkgdesc='CSS parser based on the CSS Syntax Level 3 spec'
arch=(any)
url='https://github.com/rgrove/crass/'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('49c217d5cfbd6575836a53577f418cd6ee39f1933e0e8084f0a8d4f3503e67b0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
