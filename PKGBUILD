# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=cairo-gobject
pkgname=ruby-$_gemname
pkgver=3.1.9
pkgrel=1
pkgdesc='Ruby/CairoGObject is a Ruby binding of cairo-gobject'
arch=(i686 x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-cairo ruby-glib2=$pkgver)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8f22b5b891822f1381f19a59f419ad158cdad080')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
