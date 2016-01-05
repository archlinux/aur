# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=4.30.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
optdepends=('ruby-sqlite3: SQLite support')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('524fc1bf7684e0b77164d6c64aca3b358ad94e26e3095e6972e4a0d9c481c84a')
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
