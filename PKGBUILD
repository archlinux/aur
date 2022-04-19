# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=sawsge
pkgname=sawsge
pkgver=0.1.3
pkgrel=1
pkgdesc='Simple Markdown static site generator for blogs or projects'
arch=(any)
url='https://github.com/sawshep/sawsge'
license=(GPL3)
depends=(ruby ruby-toml pandoc ruby-pandoc-ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('942652207c2154012f7ebf1b7ffcda1161ee05ae270d61180e2b8b7333061cf5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
