# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gio2
pkgname=ruby-$_gemname
pkgver=3.1.1
pkgrel=1
pkgdesc='Ruby/GIO2 is a Ruby binding of gio-2.x.'
arch=(i686 x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-glib2=$pkgver ruby-gobject-introspection=$pkgver)
makedepends=(gobject-introspection)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('3ceb8be6ec962cc8958ca75498275d385324de8d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
