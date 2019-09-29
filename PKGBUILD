_npmname=pnpm
_npmver=3.8.1
pkgname=nodejs-pnpm
pkgver=3.8.1
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=(any)
url='https://github.com/pnpm/pnpm'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('c42d87a8a90d861960f563cad0745a023e8b9fc81cf2217b0682f2dc6341054b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
