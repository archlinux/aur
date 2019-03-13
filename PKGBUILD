# Maintainer: farwayer <farwayer@gmail.com>

_gemname=uber
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=3
pkgdesc='Gem-authoring tools like generic builders, dynamic options and more.'
arch=(any)
url='https://github.com/apotonick/uber'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('65d97603e8d30519288c78474b18e021ddf1c9a7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
