# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=sawsge
pkgname=sawsge
pkgver=1.0.1
pkgrel=1
pkgdesc='Simple Markdown static site generator for blogs or projects'
arch=(any)
url='https://github.com/sawshep/sawsge'
license=(GPL3)
depends=(ruby ruby-tomlrb pandoc ruby-pandoc-ruby ruby-nokogiri ruby-parallel)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6ae33bbc23f25f46b02f2f1ed9d4fe296cfbd94f1c145fba7941748a1a98d1a4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
