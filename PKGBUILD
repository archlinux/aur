# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
_gemname=influxdb
pkgname=ruby-$_gemname
pkgver=0.1.8
pkgrel=1
pkgdesc="The Official Ruby library for InfluxDB"
arch=('any')
url="https://github.com/influxdb/influxdb-ruby/"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
optdepends=('influxdb')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a4da7ac1eeb245b8f76a668fdf516df4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
