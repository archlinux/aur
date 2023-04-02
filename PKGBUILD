# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gdk4
pkgname=ruby-$_gemname
pkgver=4.1.2
pkgrel=1
pkgdesc='Ruby/GDK4 is a Ruby binding of GDK-4.x.'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby gtk4 ruby-cairo-gobject=$pkgver ruby-gdk_pixbuf2=$pkgver ruby-pango=$pkgver)
makedepends=(ruby-native-package-installer rake)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3902c58c3c0291341cd042807da83339193cdef21a548af3255f91a0e5b458cd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
