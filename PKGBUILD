# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-wmctrl
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc="Window Manager plugin for Fusuma"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-wmctrl"
license=(MIT)
depends=(ruby ruby-fusuma wmctrl)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7995b9a9c9046b4ae808e1bb5aafe6b7fbf2d0d8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
