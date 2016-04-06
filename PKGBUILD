_npmname=npm-check
_npmver=5.1.3
pkgname=nodejs-npm-check
pkgver=5.1.3
pkgrel=1
pkgdesc="Check for outdated, incorrect, and unused dependencies."
arch=(any)
url="https://github.com/dylang/npm-check"
license=('MIT')
depends=('nodejs' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('158537719fe5b78399ba222623cdf8d6b77f1a84')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
