# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=wisper
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=1
pkgdesc='A micro library providing Ruby objects with Publish-Subscribe capabilities'
arch=(any)
url='https://github.com/krisleech/wisper'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4f8966659966059f4b190d02b3135352b28c9646')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
