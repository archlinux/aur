# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
_gemname=mqtt
pkgname=ruby-$_gemname
pkgver=0.3.1
pkgrel=1
pkgdesc="Pure Ruby gem that implements the MQTT protocol"
arch=('any')
url="https://github.com/njh/ruby-mqtt"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a38d295ac0f4a9bcd1790b244425fa3f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
