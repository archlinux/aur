# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=4.34.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
optdepends=('ruby-sqlite3: SQLite support')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('a1071d17fa8b8c3a0778ed2d530036f6ce89b6248ad4b5fb7b5231ee6e6b4c63')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('sequel' 'ruby-sequel')
conflicts=('sequel')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
