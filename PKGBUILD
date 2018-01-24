# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=hammer_cli_foreman
pkgname=ruby-${_gemname//_/-}
pkgver=0.11.0
pkgrel=1
pkgdesc='Foreman commands for Hammer CLI'
arch=(i686 x86_64)
url='http://github.com/theforeman/hammer-cli-foreman'
license=(GPLv3)
depends=('ruby'
         'ruby-apipie-bindings>=0.2.0'
         'ruby-hammer-cli>=0.11.0'
         'ruby-rest-client>=1.8.0' 'ruby-rest-client<3.0.0')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('a7d0480ae5cde3c651eb381de8fa9d93638e788bae128a7ace0718429b9fcc16')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
