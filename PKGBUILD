# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=blockenspiel
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc='Blockenspiel is a helper library designed to make it easy to implement DSL blocks.'
arch=(any)
url='http://dazuma.github.com/blockenspiel'
license=(BSD-3-Clause)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('aed90208f7f4db3884ae496eb111e7a02453db0f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
