# Maintainer: farwayer <farwayer@gmail.com>

_gemname=declarative-option
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=3
pkgdesc='Dynamic options to evaluate at runtime.'
arch=(any)
url='https://github.com/apotonick/declarative-option'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('74d6f23aed302881f89ea34caae6f73ccb81366a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
