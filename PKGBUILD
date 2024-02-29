# Maintainer: Husam Bilal <me@husam.dev>

_gemname=google-protobuf
pkgname=ruby-$_gemname
pkgver=3.25.3
pkgrel=1
pkgdesc="Protocol Buffers are Google's data interchange format."
arch=(any)
url='https://developers.google.com/protocol-buffers'
license=(BSD3)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('39bd97cbc7631905e76cdf8f1bf3dda1c3d05200d7e23f575aced78930fbddd6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

