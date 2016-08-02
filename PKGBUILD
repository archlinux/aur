_npmname=pnpm
_npmver=0.24.0
pkgname=nodejs-pnpm
pkgver=0.24.0
pkgrel=1
pkgdesc="Performant npm installations"
arch=(any)
url='https://github.com/rstacruz/pnpm'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('a646cb4433666899166aea88186b1f2494cb3f8dfe962b79a742dcb0a71b2aa9')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
