_npmname=pnpm
_npmver=3.1.0
pkgname=nodejs-pnpm
pkgver=3.1.0
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
sha256sums=('d98935b1d6000c41e053fabe372643fa7bedf945daa2601d5cb18fe10c10c0fe')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
