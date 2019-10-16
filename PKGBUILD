# Maintainer: Anatol Pomozov

_gemname=gtk3
pkgname=ruby-$_gemname
pkgver=3.4.1
pkgrel=1
pkgdesc='Ruby/GTK3 is a Ruby binding of GTK+-3.x.'
arch=(x86_64)
url=https://ruby-gnome2.osdn.jp/
license=("LGPL-2.1+")
depends=(gobject-introspection gtk3 ruby ruby-atk ruby-cairo ruby-gdk3 ruby-gdk_pixbuf2 ruby-gio2 ruby-gobject-introspection ruby-pango)
makedepends=(ruby-native-package-installer ruby-glib2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b0ffb0aaaf8ff52ba4413eba76babccc3c21d313')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-document --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem 
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.LIB" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}
