_npmname=nativescript
_npmver=3.4.0
pkgname=nativescript-cli # All lowercase
pkgver=3.4.0
pkgrel=1
pkgdesc="The NativeScript CLI lets you create, build, and deploy NativeScript-based projects on iOS and Android devices."
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(c71af9ae94fbb88b4589c868ba2317ba9f4f91e164bebe113747345e07d5a2d3)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
