# Maintainer: farawayer <farwayer@gmail.com>

_gemname=colored2
pkgname=ruby-$_gemname
pkgver=3.1.2
pkgrel=3
pkgdesc='Add even more color to your life.'
arch=(any)
url='http://github.com/kigster/colored2'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('d4a2b7652b746db3e2f2617a858a7993eada1d63')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
