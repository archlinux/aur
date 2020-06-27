# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

_gemname=mqtt
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc="Pure Ruby gem that implements the MQTT protocol"
arch=('any')
url="https://github.com/njh/ruby-mqtt"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('998c795f742711053de235b2b71f1860a7c7c3c22a8d3c845c5e0e0c9215b74330e71fb50798e8d45a9b188f588370b988446000a33e1e9b2f6ec85c4a59dac7')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
