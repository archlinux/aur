# Maintainer: Husam Bilal <husam212@gmail.com>

_gemname=gnuplot
pkgname=ruby-$_gemname
pkgver=2.6.2
pkgrel=1
pkgdesc="Utility library to aid in interacting with gnuplot from ruby"
arch=(any)
url='http://github.com/rdp/ruby_gnuplot'
license=(BSD3)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d2c28d4a55867ef6f0a5725ce157581917b4d27417bc3767c7c643a828416bb3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

