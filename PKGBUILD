# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-router
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='Rack compatible HTTP router for Ruby.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-http_router ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d61559da1aa10d2e377d7c59ead58ce0be518bee04b1d07604bfbf47f452113f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
