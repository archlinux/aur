# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gdk3
pkgname=ruby-$_gemname
pkgver=3.4.5
pkgrel=1
pkgdesc='Ruby/GDK3 is a Ruby binding of GDK-3.x.'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby gtk3 ruby-cairo-gobject=$pkgver ruby-gdk_pixbuf2=$pkgver ruby-pango=$pkgver)
makedepends=(ruby-native-package-installer rake)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5602fcb69846e18591088a321353c8895062684c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
