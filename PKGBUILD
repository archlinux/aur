_gemname=twitter-text
pkgname=ruby-$_gemname
pkgver=3.1.0
pkgrel=1
pkgdesc='Twitter text handling library'
arch=(any)
url='http://twitter.com'
license=('Apache 2.0')
depends=(ruby ruby-unf-1 ruby-idn-ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7fa4b3abf380ba26f3b4d310f41c6fecab0c0f137e7d51d6b201d02117b8d5b6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
