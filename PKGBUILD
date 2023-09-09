# Maintainer: Husam Bilal <me@husam.dev>

_gemname=google-protobuf
pkgname=ruby-$_gemname
pkgver=3.24.3
pkgrel=1
pkgdesc="Protocol Buffers are Google's data interchange format."
arch=(any)
url='https://developers.google.com/protocol-buffers'
license=(BSD3)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('63f3cceb398b5f3258760da95037d26ef65405aa3425fd7ba1560fce4827945d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

