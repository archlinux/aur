# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=ektoplayer
pkgver=0.1.20
pkgrel=1
pkgdesc='play and download techno music from ektoplazm.com'
arch=(any)
url='http://github.com/braph/ektoplayer'
license=(GPL)
depends=(ruby ruby-sqlite3 ruby-nokogiri ruby-ncursesw mpg123)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha1sums=('19c079eb11c2121661101f10d4395b459cbb5ec9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
