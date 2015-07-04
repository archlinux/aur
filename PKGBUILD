# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=4.24.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('b2d091c22d2728ec71504eb9e0ebfe79e9b6de17857491604200349dcfcc0918')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('sequel' 'ruby-sequel')
conflicts=('sequel')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
