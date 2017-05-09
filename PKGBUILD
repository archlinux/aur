_npmname=typings
_npmver=2.1.1
pkgname=nodejs-typings
pkgver=2.1.1
pkgrel=1
pkgdesc="TypeScript Definition manager for DefinitelyTyped"
arch=(any)
url="https://github.com/typings/typings"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('ddd2a6fe3c6fec39c46d1cad0062aee4fd36b05fe6a75449cbe09a2d79a879d9')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
