# Maintainer: gardenapple <gardenapple@posteo.net>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=rake
pkgname=ruby-$_gemname-12
pkgver=12.3.3
pkgrel=2
pkgdesc='Make-like build tool implemented in Ruby'
provides=("ruby-rake=$pkgver")
conflicts=(ruby-rake)
arch=(any)
url='https://ruby.github.io/rake/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f585a1115325f3a64c2fc719b6f6cd7b33a4ab59')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
