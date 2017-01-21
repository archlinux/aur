_npmname=typings
_npmver=2.1.0
pkgname=nodejs-typings
pkgver=2.1.0
pkgrel=1
pkgdesc="TypeScript Definition manager for DefinitelyTyped"
arch=(any)
url="https://github.com/typings/typings"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('9cdbe0cd1626ab61b379e06ba4a3910d1d791006')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
