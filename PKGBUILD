# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-compute_v1
pkgname=ruby-$_gemname
pkgver=0.53.0
pkgrel=1
pkgdesc='simple REST client for Compute Engine API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-compute_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e91cdf7b3c9c23275ec4ed00aaf44f2324a287a0702cfbded675dc6488142c6bdb39b84941937208c07867e8551bcf027fb2a961e56ddb96f0a78ad85da5bb32')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
