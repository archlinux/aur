# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=evdev
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="A ruby object wrapper around libevdev bindings."
arch=(any)
url="https://github.com/christopheraue/ruby-evdev"
license=(MIT)
depends=(ruby ruby-libevdev ruby-callbacks_attachable-2.3)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('02d720f00a212724dcf0ef0135f3d07e95951f82')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
