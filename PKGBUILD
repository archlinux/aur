# Maintainer: sasvari <sasvari@fastmail.com>
# copied from ruby-rouge-2.0 farwayer <farwayer@gmail.com>

_gemname=rouge
pkgname=ruby-$_gemname-2.1
pkgver=2.1.1
pkgrel=1
pkgdesc='Rouge aims to a be a simple, easy-to-extend drop-in replacement for pygments.'
arch=(any)
url='http://rouge.jneen.net/'
license=(MIT)
provides=('ruby-rouge=2.1')
conflicts=('ruby-rouge')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('4635e65e8a2dfb05e1bd969b137622e3754931308d23c61dfcee1f604256e5f81ddc633898cda67b66f2bb1b70e9ebc4e79f4057c168579b7b31f6b24b7cf209')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
