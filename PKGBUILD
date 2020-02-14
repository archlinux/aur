# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>
# Past Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Adam Lloyd <lloyda2 (at) rpi (dot) edu>

pkgname=maruku
pkgver=0.7.3
pkgrel=0
pkgdesc="A pure-Ruby Markdown-superset interpreter"
arch=(any)
url="https://github.com/bhollis/maruku"
license=("MIT")
depends=(ruby)
makedepends=(rubygems)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=("dd14156f57b5433993710adca63b766d18b36f6e35cb25c21b178a6edfedebe4")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
