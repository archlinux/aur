# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=ruby-icalendar
pkgver=2.10.2
pkgrel=5
pkgdesc='Internet calendaring, Ruby style'
arch=('any')
url='https://github.com/icalendar/icalendar'
license=('Ruby')
depends=()
optdepends=('ruby-activesupport: ActiveSupport is required for TimeWithZone support, but not required for general use.')
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('d70ecdca4219ad6af220d8cb6aa78170f1931c6e56be45fdf0e077060a555608')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name ${pkgname#*-}-$pkgver}.gem -delete
}

