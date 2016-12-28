# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-types
pkgname=ruby-$_gemname
pkgver=0.9.3
pkgrel=1
pkgdesc='Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc.'
arch=(any)
url='https://github.com/dryrb/dry-types'
license=(MIT)
depends=(ruby ruby-concurrent-ruby ruby-dry-configurable ruby-dry-container ruby-dry-core ruby-dry-equalizer ruby-dry-logic ruby-inflecto)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('2db96a40f4efab0b991fb937c72538e9c58bfc7ee5ab76690bdeb29b1e6e6a8e')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
