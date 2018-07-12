_npmname=pnpm
_npmver=2.12.0-0
pkgname=nodejs-pnpm
pkgver=2.12.0
pkgrel=1
pkgdesc="Performant npm installations"
arch=(any)
url='https://github.com/rstacruz/pnpm'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('06aac8ba007667e528dc0414f010a6fe0e23aadd4502ec4221e70c8e90c5a9b3')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
