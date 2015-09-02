# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sequel
pkgver=4.26.0
pkgrel=1
pkgdesc="The Database Toolkit for Ruby"
arch=('any')
url="http://sequel.jeremyevans.net"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('5c51e86898700976e19888a7a94b5ea4ee80331d8a31c6b761a9f90bcf9455c0')
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
