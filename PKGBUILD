# Contributor: farawayer <farwayer@gmail.com>

_gemname=google-api-client
pkgname=ruby-$_gemname
pkgver=0.53.0
pkgrel=1
pkgdesc='Client for accessing Google APIs'
arch=(any)
url='https://github.com/google/google-api-ruby-client'
license=('Apache 2.0')
depends=(
  'ruby-google-apis-core'
  'ruby-google-apis-generator'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('41006ef21fe02a70cff39a10aebf84fa7fb5f24c63566ab12b149ff1f1d9d7ff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
