# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gio2
pkgname=ruby-$_gemname
pkgver=3.2.3
pkgrel=1
pkgdesc='Ruby/GIO2 is a Ruby binding of gio-2.x.'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-glib2=$pkgver ruby-gobject-introspection=$pkgver)
makedepends=(gobject-introspection ruby-native-package-installer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d14b0e652b38f4f19c4169fd48bab843f020c46')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
