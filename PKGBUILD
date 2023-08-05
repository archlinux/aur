# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-core
pkgname=ruby-$_gemname
pkgver=0.11.1
pkgrel=1
pkgdesc='Common utility and base classes for legacy Google REST clients'
arch=(any)
url='https://rubygems.org/gems/google-apis-core'
license=(Apache-2.0)
depends=(ruby-addressable ruby-googleauth ruby-httpclient ruby-mini_mime ruby-representable ruby-retriable ruby-rexml ruby-webrick)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('917611234f38276524801058b8a56cdf496ff061b07295ef93cd5b8abd3b97fc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
