# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ruby-rspec-puppet
pkgver=2.9.0
pkgrel=1
pkgdesc='RSpec tests for your Puppet manifests'
arch=('x86_64')
url='https://github.com/rodjek/rspec-puppet'
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('f6da6af8834a0af7d64cbc2f15b83853be4e108db7b0ec72735d45fee0c22534')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}