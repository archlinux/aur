# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-core
pkgname=ruby-$_gemname
pkgver=0.9.1
pkgrel=1
pkgdesc='Common utility and base classes for legacy Google REST clients'
arch=(any)
url='https://rubygems.org/gems/google-apis-core'
license=(Apache-2.0)
depends=(ruby-addressable ruby-googleauth ruby-httpclient ruby-mini_mime ruby-representable ruby-retriable ruby-rexml ruby-webrick)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('9b97db821171552bf889255c479724aaaeb484817c04026334dd736e930396836fb063c51c62f30dce5ea928e757cc781211b689da108b04c77bdf338fce7f7c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
