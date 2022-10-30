# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-monitoring_v3
pkgname=ruby-$_gemname
pkgver=0.37.0
pkgrel=1
pkgdesc='simple REST client for Cloud Monitoring API V3'
arch=(any)
url='https://rubygems.org/gems/google-apis-monitoring_v3'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('2d9262ae8dfa83ac7db895b03c7deeaae9f13107e94c8781a432202fbc20736a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

