# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-router
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc='Rack compatible HTTP router for Ruby.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-http_router ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('288c461cb4736e675168da7199729a528e549e3e523f1b8447be1c9eead557cb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
