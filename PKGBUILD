# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-keypress
pkgname=ruby-$_gemname
pkgver=0.4.2
pkgrel=1
pkgdesc="Keypress combination plugin for Fusuma"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-keypress"
license=(MIT)
depends=(ruby ruby-fusuma)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c5a1033fcfc2fce97d25c128a5c7cf1dd9bb8720')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
