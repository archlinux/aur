# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gobject-introspection
pkgname=ruby-$_gemname
pkgver=3.3.8
pkgrel=1
pkgdesc='Ruby/GObjectIntrospection is a Ruby binding of GObjectIntrospection.'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby gobject-introspection-runtime ruby-glib2=$pkgver)
makedepends=(gobject-introspection ruby-native-package-installer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('93c905a7b12e2b74f4f2372c54a90d510bd4fd7f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
