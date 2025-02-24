# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-remap
pkgname=ruby-$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc="A Fusuma plugin for remapping keyboard events into virtual input devices."
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-remap"
license=(MIT)
depends=(ruby ruby-fusuma ruby-msgpack ruby-ruinput)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('bde4a35cced58dcd58e3cf0480f72e827a27e254')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
