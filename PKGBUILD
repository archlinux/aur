_npmname=nativescript
_npmver=4.1.0
pkgname=nativescript-cli # All lowercase
pkgver=4.1.0
pkgrel=1
pkgdesc="The NativeScript CLI lets you create, build, and deploy NativeScript-based projects on iOS and Android devices."
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(490d16aafc928c586e9b474070158792a4a2f51241460745844dc61cafd31f7b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
