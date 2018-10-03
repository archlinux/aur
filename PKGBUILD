_npmname=pnpm
_npmver=2.16.2
pkgname=nodejs-pnpm
pkgver=2.16.2
pkgrel=1
pkgdesc="Performant npm installations"
arch=(any)
url='https://github.com/rstacruz/pnpm'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('3ce16d61d2fd3b7a00275a20a34a4a93c983b5d64c5f93f7ebe6dd6320214801')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
