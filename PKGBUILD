_npmname=pnpm
_npmver=0.65.3
pkgname=nodejs-pnpm
pkgver=0.65.3
pkgrel=1
pkgdesc="Performant npm installations"
arch=(any)
url='https://github.com/rstacruz/pnpm'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('d7fffe2845ffe15298ae8289a48566ffe623d5b27c35c599d3f650ca4fc1c107')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
