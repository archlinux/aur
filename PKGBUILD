# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=sawsge
pkgname=sawsge
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple Markdown static site generator for blogs or projects'
arch=(any)
url='https://github.com/sawshep/sawsge'
license=(GPL3)
depends=(ruby ruby-tomlrb pandoc ruby-pandoc-ruby ruby-nokogiri ruby-parallel)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3704f446da8466841131e283f83aa54a2f1e2e1243c84273d8834312d4087b7f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
