# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=3.0.0
pkgrel=1
pkgdesc='RSpec tests for your Puppet manifests'
arch=('any')
url='https://github.com/puppetlabs/rspec-puppet'
license=('MIT')
depends=('ruby-rspec')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('359cc99b2a6ed1712e7ae498c625532911b8dcff3dad48cb566619f7a223bcf8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}
