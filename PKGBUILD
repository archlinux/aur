# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-tap
pkgname=ruby-$_gemname
pkgver=0.1.3
pkgrel=2
pkgdesc="Tap and Hold gestures plugin for Fusuma"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-tap"
license=(MIT)
depends=(ruby ruby-fusuma)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7de8183a7718f7077a3b031e833c2e19e36ad0de')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
