_npmname=npm-check
_npmver=5.7.1
pkgname=nodejs-npm-check
pkgver=5.7.1
pkgrel=1
pkgdesc="Check for outdated, incorrect, and unused dependencies."
arch=(any)
url="https://github.com/dylang/npm-check"
license=('MIT')
depends=('nodejs' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('1f5da05b02d8fd7b92b3d4303bc8209abe795177')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
