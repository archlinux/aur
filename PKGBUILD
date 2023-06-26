# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com > 

_gemname=google-apis-generator
pkgname=ruby-$_gemname
pkgver=0.12.0
pkgrel=1
pkgdesc='Code generator for legacy Google REST clients'
arch=(any)
url='https://github.com/google/google-api-ruby-client'
license=('Apache 2.0')
depends=(
  'ruby-activesupport'
  'ruby-gems'
  'ruby-google-apis-core'
  'ruby-google-apis-discovery_v1'
  'ruby-thor'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b657528b59b27b6c14adf08182dfcb5729994c03eacbe5dedf093971701615e1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
