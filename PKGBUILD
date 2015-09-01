# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=ruby-icalendar
pkgver=2.3.0
pkgrel=2
pkgdesc='Internet calendaring, Ruby style'
arch=('any')
url='https://github.com/icalendar/icalendar'
license=('Ruby')
depends=()
optdepends=('ruby-activesupport-4.1: ActiveSupport is required for TimeWithZone support, but not required for general use.')
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('e03c0b2a52438c78661ab56297b0cbeef48c53528814ca0e0169a2235d43527f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}

