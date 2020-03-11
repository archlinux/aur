# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=linux_input
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="FFI structs and constants for linux's input subsystem"
arch=(any)
url="https://github.com/christopheraue/ruby-linux_input"
license=(MIT)
depends=(ruby ruby-ffi)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('35e7684af89854d3d70e70054674ffd7866deeac')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
