# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farwayer <farwayer@gmail.com>

_gemname=retriable
pkgname=ruby-$_gemname
pkgver=3.1.2
pkgrel=3
pkgdesc='Retriable is an simple DSL to retry failed code blocks with randomized exponential backoff'
arch=(any)
url='https://rubygems.org/gems/retriable'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0a5a5d0ca4ba61a76fb31a17ab8f7f80281beb040c329d34dfc137a1398688e0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
