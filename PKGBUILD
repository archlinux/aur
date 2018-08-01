_npmname=shrinkpack
_npmver=0.18.1
pkgname=nodejs-shrinkpack
pkgver=0.18.1
pkgrel=1
pkgdesc="Fast, resilient, reproducible builds with npm install."
arch=(any)
url='https://github.com/JamieMason/shrinkpack'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('f62b2618a49d49587becc940c9eec8511e2771c3abab77f999b04f86e683e695')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
