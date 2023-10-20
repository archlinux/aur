# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-thumbsense
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc="Remapper from key to click only while tapping the touchpad."
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-thumbsense"
license=(MIT)
depends=(ruby ruby-fusuma ruby-fusuma-plugin-remap ruby-fusuma-plugin-keypress)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('04a6d6af22a32db3bec5d73d01a8d10f4ad2191a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
