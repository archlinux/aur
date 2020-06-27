# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

_gemname=influxdb
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc="The Official Ruby library for InfluxDB"
arch=('any')
url="https://github.com/influxdb/influxdb-ruby/"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
optdepends=('influxdb')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('b4c7b7f0123683b50e85175e9c73bb38586e39a5ec5f05b48083e2e1753d149ac90782421b914ad2f7463abb6e0f85d4cb830b8c4a41629a97275841045b58d6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
