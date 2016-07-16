_npmname=tsd
_npmver=0.6.5
pkgname=nodejs-tsd
pkgver=0.6.5
pkgrel=1
pkgdesc="TypeScript Definition manager for DefinitelyTyped"
arch=(any)
url="https://github.com/DefinitelyTyped/tsd"
license=(Apache-2.0)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('34a0b64c1db6a70b3860fe4f5571d9d1357421ad')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
