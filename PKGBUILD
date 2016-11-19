# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=nw-gyp
pkgname=nw-gyp # All lowercase
pkgver=0.12.2
pkgrel=1
pkgdesc="Native addon build tool for node-webkit"
arch=(any)
url="https://github.com/rogerwang/nw-gyp"
license=("MIT")
depends=("nodejs")
optdepends=("node-webkit: webkit runtime environment")
makedepends=('nodejs')
source=( "http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz" )
noextract=($_npmname-$pkgver.tgz)
sha256sums=('33549526941baf147d60fab412b4028158bf293a396b79c3f521bcaff9e2aa0a')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
