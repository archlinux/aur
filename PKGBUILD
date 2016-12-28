# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-view
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc='View layer for Hanami.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-tilt)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5e7f29fb004462b7b486c467ef26e89e45c00539725555dfe8a4e32b6a1e57f6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
