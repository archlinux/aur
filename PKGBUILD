# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-utils
pkgname=ruby-$_gemname
pkgver=0.9.2
pkgrel=1
pkgdesc='Hanami utilities.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5c3f71e4ef971654e6bef5c43cd94ea6e6fb041194eb234367a8df034f8d9b87')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
