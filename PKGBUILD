# Maintainer: farwayer <farwayer@gmail.com>

_gemname=retriable
pkgname=ruby-$_gemname
pkgver=3.1.2
pkgrel=2
pkgdesc='Retriable is an simple DSL to retry failed code blocks with randomized exponential backoff'
arch=(any)
url='http://github.com/kamui/retriable'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ea7e34ceb39e6185b57d654992c0ade6985b18b9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
