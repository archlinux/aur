# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=0.4.7
pkgrel=3
pkgdesc='OAuth Core Ruby implementation.'
arch=("any")
url='https://rubygems.org/gems/oauth'
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bca47d77c946af466872269e37e470837858b1305d5143e5a56c50356e02b2cc')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
