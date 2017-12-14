_npmname=pnpm
_npmver=1.23.2
pkgname=nodejs-pnpm
pkgver=1.23.2
pkgrel=1
pkgdesc="Performant npm installations"
arch=(any)
url='https://github.com/rstacruz/pnpm'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('fab8274df14f9a0996716760985c4a873a0cfd393c1638e117457fec5bc1fc53')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
