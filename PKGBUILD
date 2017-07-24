# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=cairo-gobject
pkgname=ruby-$_gemname
pkgver=3.1.8
pkgrel=1
pkgdesc='Ruby/CairoGObject is a Ruby binding of cairo-gobject'
arch=(i686 x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-cairo ruby-glib2=$pkgver)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('72b2411625555e65a8c63b79f3cf829f2abda96c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
