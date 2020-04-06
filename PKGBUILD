# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-wmctrl
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=2
pkgdesc="Window Manager plugin for Fusuma"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-wmctrl"
license=(MIT)
depends=(ruby ruby-fusuma wmctrl)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('39527623890bd11fa3a2adcc24d2ccbf7f31d8c1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
