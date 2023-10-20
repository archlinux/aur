# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=ruinput
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc="a ruby binding for uinput.h"
arch=(any)
url="https://github.com/kui/ruinput"
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c8734835f9ae148c93926b1b1dacc6a7f18c9c07')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
