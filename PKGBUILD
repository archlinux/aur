# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=backport
pkgname=ruby-backport
pkgver=1.1.1
pkgrel=0
pkgdesc="A pure Ruby library for event-driven IO"
arch=("any")
depends=(ruby)
makedepends=(rubygems)
url="https://github.com/castwide/backport"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("59dafc60e88cdf6611bd854894d1e4aee7a3284333c47431c656563c94e0450e")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
