_npmname=nativescript
_npmver=3.3.0
pkgname=nativescript-cli # All lowercase
pkgver=3.3.0
pkgrel=1
pkgdesc="NativeScript CLI"
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(988bfcfd0008b0b581a8306e0190b89ec0165185654d35d4e05a531435f85219)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
