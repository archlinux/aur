# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com > 

_gemname=google-apis-discovery_v1
pkgname=ruby-$_gemname
pkgver=0.14.0
pkgrel=1
pkgdesc='simple REST client for API Discovery Service V1'
arch=(any)
url='https://github.com/google/google-api-ruby-client'
license=('Apache 2.0')
depends=(
  'ruby-google-apis-core'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a2236bee42f3150b83a255f4b6024761d80a8126b69d208855729c9e26f42b3d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
