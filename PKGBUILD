_npmname=nativescript
_npmver=5.1.1
pkgname=nativescript-cli # All lowercase
pkgver=5.1.1
pkgrel=1
pkgdesc="The NativeScript CLI lets you create, build, and deploy NativeScript-based projects on iOS and Android devices."
arch=(any)
url="https://www.npmjs.com/package/nativescript"
license=('Apache 2.0')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(bfb16bd4a378209998de84d6f7018842bb7c72dea82e198c4a503a1b63570d22)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
}
