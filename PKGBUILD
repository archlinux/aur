# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-compute_v1
pkgname=ruby-$_gemname
pkgver=0.64.0
pkgrel=1
pkgdesc='simple REST client for Compute Engine API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-compute_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('ff3ca06053ec4a16051917fdfedb43ec188b0b5572dbcf98580b53359387e0d8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
