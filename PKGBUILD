# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-equalizer
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='Module to define equality, equivalence and inspection methods.'
arch=(any)
url='https://github.com/dkubb/equalizer'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('04eb741cdef5e07a68ce34215034b80c4ead2d8e0e8da81bf79616438841f201')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
