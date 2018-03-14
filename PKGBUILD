# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=hammer_cli_foreman
pkgname=ruby-${_gemname//_/-}
pkgver=0.12.1
pkgrel=1
pkgdesc='Foreman commands for Hammer CLI'
arch=(any)
url='http://github.com/theforeman/hammer-cli-foreman'
license=(GPLv3)
depends=('ruby'
         'ruby-apipie-bindings>=0.2.2'
         'ruby-hammer-cli>=0.12.0'
         'ruby-rest-client>=1.8.0' 'ruby-rest-client<3.0.0')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('352479c43fab6fb1aac52fe43bc56f4a8d70cc9ccd1e4dea4fd42f793eb5e11a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
