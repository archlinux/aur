# Maintainer: Alberto Redondo <albertomost at gmail dot com>

_gemname=twurl
pkgname=ruby-$_gemname
pkgver=0.9.6
pkgrel=1
pkgdesc="OAuth-enabled curl for the Twitter API"
arch=(any)
url="https://github.com/twitter/twurl"
license=(MIT)
depends=(ruby ruby-oauth)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('1055232009e178d95c0eebc226732430')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
