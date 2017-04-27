# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-validations
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='Validations mixin for Ruby objects and support for Hanami.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-dry-validation ruby-hanami-utils)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5351a24c1fabe8da99c8d73bfbedc5fb6905ed3fc3bd08f08cc39730e4511a09')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
