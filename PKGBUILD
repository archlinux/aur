# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-platform
_gemname=Platform
pkgver=0.4.0
pkgrel=1
pkgdesc="Hopefully robust platform sensing."
arch=('any')
url="http://rubyforge.org/projects/platform/"
license=('BSD')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
sha512sums=('c0e3a30e3a04b8ebfd91a7b46eb87d7adc015503c9a1fe42cf031ebbb3dd4ce1b48bdf301014b470b21fb0252bba8bdfad080e174a8798443c0d899f14f64bb9')
