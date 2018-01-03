# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gobject-introspection
pkgname=ruby-$_gemname
pkgver=3.2.1
pkgrel=2
pkgdesc='Ruby/GObjectIntrospection is a Ruby binding of GObjectIntrospection.'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby gobject-introspection-runtime ruby-glib2=$pkgver)
makedepends=(gobject-introspection ruby-native-package-installer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0afd1f3fcfed20d8dde5799605553bd4d23c6811')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
