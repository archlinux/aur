# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-fog-powerdns
_gemname=fog-powerdns
pkgver=0.2.0
pkgrel=1
pkgdesc="This library can be used as a module for 'fog' or as a standalone provider to use PowerDNS DNS services in applications."
arch=('any')
url="https://github.com/fog/fog-powerdns"
license=('MIT')
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('a47dd7329dda99ca8b85ad2a9db69cf08339ad29ecc80926770a300a982bc432deb7ab06048eb49df65da6dd0f03f71ea3dcbcbaac5f44b66d3a47e82ba5314a')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
