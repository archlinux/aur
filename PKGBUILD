# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=subexec
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=2
pkgdesc="Spawns a subprocess with an optional timeout."
arch=(any)
url="https://github.com/pressly/subexec"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d9b6305cccf8a2b16a69a045454349c863a6ee8d33d9b50f9c98119e5be1dc7d')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
