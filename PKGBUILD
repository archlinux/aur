# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=equalizer
pkgname=ruby-$_gemname
pkgver=0.0.11
pkgrel=1
pkgdesc='Module to define equality, equivalence and inspection methods.'
arch=(any)
url='https://github.com/dkubb/equalizer'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('44e5bc46f49883e83d159ee9b1f7320b4ae8283bb6329e5d9716f5e7dde855ce')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
