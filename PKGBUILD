# Maintainer: Husam Bilal <me@husam.dev>

_gemname=google-protobuf
pkgname=ruby-$_gemname
pkgver=3.21.9
pkgrel=1
pkgdesc="Protocol Buffers are Google's data interchange format."
arch=(any)
url='https://developers.google.com/protocol-buffers'
license=(BSD3)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5a656c159aa2c85008af7eab3f603cf22921b748e09438f6682dcf696d518adc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

