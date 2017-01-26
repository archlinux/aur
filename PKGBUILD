# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gobject-introspection
pkgname=ruby-$_gemname
pkgver=3.1.1
pkgrel=1
pkgdesc='Ruby/GObjectIntrospection is a Ruby binding of GObjectIntrospection.'
arch=(i686 x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby gobject-introspection-runtime ruby-glib2=$pkgver)
makedepends=(gobject-introspection)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('57f5356e95bef69794e69641dc327f9e2d3febf1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
