# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sigar
pkgver=0.7.3
pkgrel=1
pkgdesc="System Information Gatherer And Reporter"
arch=('i686' 'x86_64')
url="http://sigar.hyperic.com/"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('250a3bd8170f51bf377aa666d44ae08a321c655a2c63c14dffa41fe478308d88')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
