# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Olivier Médoc "oliv" <o_medoc@yahoo.fr>
pkgname=ruby-colored
_gemname=colored
pkgver=1.2
pkgrel=2
pkgdesc='Ruby library for colorizing text output in your terminal'
arch=(any)
url="http://github.com/defunkt/colored"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('1b1a0f16f7c6ab57d1a2d6de53b13c42')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
