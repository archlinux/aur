# Maintainer: Husam Bilal <husam212@gmail.com>

_gemname=google-protobuf
pkgname=ruby-$_gemname
pkgver=3.2.0.2
pkgrel=1
pkgdesc="Protocol Buffers are Google's data interchange format."
arch=(any)
url='https://developers.google.com/protocol-buffers'
license=(BSD3)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5443d72483a0dd37ecb7e5f14e59b1c11f0a806aabe4b7d679f244731398a3cd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

