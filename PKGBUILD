# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-compute_v1
pkgname=ruby-$_gemname
pkgver=0.54.0
pkgrel=1
pkgdesc='simple REST client for Compute Engine API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-compute_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e7557067c6a640a04e41fc167d905dd42937f4d1bf40ef5ddea289aa3da256494c87f2439a0fca05885115e1067d24f755b92e16c8d024c12ca88e0b345237da')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
