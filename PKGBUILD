_npmname=typings
_npmver=1.3.1
pkgname=nodejs-typings
pkgver=1.3.1
pkgrel=1
pkgdesc="TypeScript Definition manager for DefinitelyTyped"
arch=(any)
url="https://github.com/DefinitelyTyped/tsd"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('94d766d5200026f3ad83c22da3e4a5f479bb3c19')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
