# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=4.0.2
pkgrel=1
pkgdesc='RSpec tests for your Puppet manifests'
arch=('any')
url='https://github.com/puppetlabs/rspec-puppet'
license=('MIT')
depends=('ruby-rspec')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('1a9f6bd65700b69d4061133c05eec92d37b97a80191a06e2e19d6a3a183929c5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}
