# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-pubsub_v1
pkgname=ruby-$_gemname
pkgver=0.40.0
pkgrel=1
pkgdesc='simple REST client for Cloud Pub/Sub API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-pubsub_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a7facbdb537c363e78231f57fba19d3f9fbbc77c6655b8b79f68fb479208484d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

