# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=nw-gyp
pkgname=nw-gyp
pkgver=3.6.5
pkgrel=1
pkgdesc="Native addon build tool for nwjs-bin"
arch=(any)
url="https://github.com/rogerwang/nw-gyp"
license=("MIT")
depends=("nodejs")
optdepends=("nwjs-bin: webkit runtime environment")
makedepends=('nodejs' 'npm')
source=( "http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz" )
noextract=($_npmname-$pkgver.tgz)
sha256sums=('95c3ba849df9a17771a1033c635aafd4bc80ff55189d73fe25166bdd2bfb0ab4')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
