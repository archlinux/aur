# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-core
pkgname=ruby-$_gemname
pkgver=0.10.0
pkgrel=1
pkgdesc='Common utility and base classes for legacy Google REST clients'
arch=(any)
url='https://rubygems.org/gems/google-apis-core'
license=(Apache-2.0)
depends=(ruby-addressable ruby-googleauth ruby-httpclient ruby-mini_mime ruby-representable ruby-retriable ruby-rexml ruby-webrick)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('7aa00270d56197853743e84c2346c44001417e5ccb1c35f2b372a3c6651617b970ed3829ec37957654444c89725d60b7d41570e65da29bf7a689e276a09bc98a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
