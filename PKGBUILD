# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=5.10.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
optdepends=('ruby-sqlite3: SQLite support')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('sequel' 'ruby-sequel')
conflicts=('sequel')
md5sums=('536a90cecefb0381098567780e694c1a')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
