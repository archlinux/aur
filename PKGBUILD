# Maintainer: Jason Paris <paris3200@gmail.com>
# Contributer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=5.31.0
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
sha256sums=('19f11682cc9ac11eb6c8c897120c1daf256db88dceef955b89dc4e8ba9086257')

package() {
  cd "$srcdir"

  echo 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -r rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
