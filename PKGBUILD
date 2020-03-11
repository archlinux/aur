# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=libevdev
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="A 1:1 FFI wrapper around libevdev"
arch=(any)
url="https://github.com/christopheraue/ruby-libevdev"
license=(MIT)
depends=(ruby ruby-linux_input ruby-bundler)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f64abe8459abcf904d80b848fb753f435b7a95ad')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
