# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=gobject-introspection
pkgname=ruby-$_gemname
pkgver=3.2.9
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
sha1sums=('6a5a9682f1893d1cc3952d773128a95516d4a2a9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
