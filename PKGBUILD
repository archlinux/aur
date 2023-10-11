# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=4.0.0
pkgrel=1
pkgdesc='RSpec tests for your Puppet manifests'
arch=('any')
url='https://github.com/puppetlabs/rspec-puppet'
license=('MIT')
depends=('ruby-rspec')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('8bfb475b728cf952c91b76f55aab789aeee365f29159a5d010edbd5199eb9794')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}
