# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=2.11.1
pkgrel=1
pkgdesc='RSpec tests for your Puppet manifests'
arch=('any')
url='https://github.com/puppetlabs/rspec-puppet'
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('0492e95ae75afc6928da0f2435d4d238a8c23dbc2dd440464f2e2ed0da9cd7fe')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}