_npmname=nativescript
_npmver=4.0.1
pkgname=nativescript-cli # All lowercase
pkgver=4.0.1
pkgrel=1
pkgdesc="The NativeScript CLI lets you create, build, and deploy NativeScript-based projects on iOS and Android devices."
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(7f2956072096eada47fd54260859b9b85ce12090a018dbd6c42658d36d85eec2)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
