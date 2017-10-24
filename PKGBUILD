# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=ektoplayer
pkgver=0.1.19
pkgrel=1
pkgdesc='play and download techno music from ektoplazm.com'
arch=(any)
url='http://github.com/braph/ektoplayer'
license=(GPL)
depends=(ruby ruby-sqlite3 ruby-nokogiri ruby-ncursesw mpg123)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha1sums=('2983063c88f74051ea052f9780c3381bd808b5d7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
