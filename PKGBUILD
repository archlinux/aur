_npmname=nativescript
_npmver=3.2.1
pkgname=nativescript-cli # All lowercase
pkgver=3.2.1
pkgrel=1
pkgdesc="NativeScript CLI"
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(476e66c502869915a0f413b5fd8ea8b5b1520d2354d01b085920ae762ef228f4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
