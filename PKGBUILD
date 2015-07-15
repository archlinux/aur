# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=unicode
pkgname=ruby-$_gemname
pkgver=0.4.4.2
pkgrel=1
pkgdesc='Unicode normalization library.'
arch=(i686 x86_64)
url='http://www.yoshidam.net/Ruby.html#unicode'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7cf8ea4a38a1f1acf38009dff147628e024786eb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
