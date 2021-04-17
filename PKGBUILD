# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-wmctrl
pkgname=ruby-$_gemname
pkgver=0.4.1
pkgrel=1
pkgdesc="Window Manager plugin for Fusuma"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-wmctrl"
license=(MIT)
depends=(ruby ruby-fusuma wmctrl)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5cb17eb8bea8ffb3336b90ebc70cc85708e310a3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
