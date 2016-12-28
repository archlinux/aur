# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-helpers
pkgname=ruby-$_gemname
pkgver=0.5.1
pkgrel=1
pkgdesc='View helpers for Ruby applications.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('64a7ab438d772a806a118d905b33fc6e3004460bd0338fbd1eeebe0fc5af9005')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
