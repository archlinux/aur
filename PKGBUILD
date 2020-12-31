# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=sprockets-helpers
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc='Asset path helpers for Sprockets 2.x & 3.x applications'
arch=(any)
url='https://github.com/petebrowne/sprockets-helpers'
license=(MIT)
depends=(ruby ruby-sprockets)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('b5a7396e1da26b5c3f9b1e04a6c1868d9b8657cb')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
