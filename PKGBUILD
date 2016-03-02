# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=4.32.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
optdepends=('ruby-sqlite3: SQLite support')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('fa924e909da5cdd1cfbbc13a1141e6584469d302b7bc2c08cb62873c9fffa446')
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
