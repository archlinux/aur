# Maintainer  : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>

_gemname=scoobydoo

pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc="Cross-platform which for Ruby"
arch=('any')
url='http://mjwhitta.github.io/scoobydoo'
license=('GPL3')
depends=('ruby')

source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f2e29d3c30e83bb7efc09b307fb6d6258386168b8366884f45c0e93b00c090bc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set sts=2 sw=2 ts=2 et:
