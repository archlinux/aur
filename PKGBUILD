# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-assets
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='Assets management for Ruby web applications.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-helpers ruby-hanami-utils ruby-tilt)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('259404885afad40a1f41111a2dede665aee48b8cbe8a6904caf64a404eba94cb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
