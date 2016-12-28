# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-container
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc='A simple container intended for use as an IoC container.'
arch=(any)
url='https://github.com/dryrb/dry-container'
license=(MIT)
depends=(ruby ruby-concurrent-ruby ruby-dry-configurable)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9672f9eec9fa116212f60a2645e59a56761418dbc87f5bf915b0e51629c0a93c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
