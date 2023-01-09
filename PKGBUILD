# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gdk4
pkgname=ruby-$_gemname
pkgver=4.0.6
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
sha256sums=('34152e9cf3a669f5d3f2000b38cb758bb178c619d2290baecdc0c39f76b2ed19')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
