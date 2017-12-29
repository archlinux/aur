_npmname=ionic
_npmver=3.19.0
pkgname=ionic-cli
pkgver=3.19.0
pkgrel=1
pkgdesc="The Ionic command line interface (CLI) is your go-to tool for developing Ionic apps"
arch=(any)
url="http://ionicframework.com/"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(dcee28813b75ee58ea259bd968814565a40648b93d87175275a71b04fd9e9031)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz
  rm -r "$pkgdir"/usr/etc
}

