_npmname=pnpm
_npmver=3.4.1
pkgname=nodejs-pnpm
pkgver=3.4.1
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
sha256sums=('d81559b1c254b249aa1cdc3d5020c420950860e5187df9b7b882ad70f24f6b5e')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
