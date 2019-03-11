# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=cairo-gobject
pkgname=ruby-$_gemname
pkgver=3.3.3
pkgrel=1
pkgdesc='Ruby/CairoGObject is a Ruby binding of cairo-gobject'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-cairo ruby-glib2=$pkgver)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c8f6ec6fc063805158a64c7c63f9327f25557d24')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
