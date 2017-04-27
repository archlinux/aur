# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-controller
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='Complete, fast and testable actions for Rack.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('501edc54d3f93716abe2c23d7176ae2f4008537d3b6fed6f3b27e2bb8c746833')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
