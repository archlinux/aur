# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=oj
pkgname=ruby-$_gemname
pkgver=2.12.2
pkgrel=2
pkgdesc="The fastest JSON parser and object serializer."
arch=('i686' 'x86_64')
url="http://www.ohler.com/oj/"
license=('MIT' 'GPL')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bd333250bdfbef4ad3a89ac5a4fc0878c283409a1402c81a652375282f8fc26f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
