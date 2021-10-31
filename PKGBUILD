# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-sendkey
pkgname=ruby-$_gemname
pkgver=0.6.3
pkgrel=1
pkgdesc="Fusuma plugin that sending virtual keyboard events."
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-sendkey"
license=(MIT)
depends=(ruby ruby-fusuma ruby-revdev)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('656c4f48a05d658c0ad59acfaa557064a10b355c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
