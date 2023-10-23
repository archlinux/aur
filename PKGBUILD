# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-appmatcher
pkgname=ruby-$_gemname
pkgver=0.6.1
pkgrel=1
pkgdesc="Fusuma plugin configure app-specific gestures"
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-appmatcher"
license=(MIT)
depends=(ruby ruby-fusuma ruby-dbus ruby-rexml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('aed7d6344bc2f278e8fd93d225814b6aecf3e4a3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
