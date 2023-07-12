# Maintainer: Daniel Nagy <danielnagy at gmx de>

_npmname=nw-gyp
pkgname=nw-gyp
pkgver=3.6.6
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
sha256sums=('7984a6e793b17b9f1a5a7db75623192a2fc3ce777fcde4b40bae1d7d4f0495a3')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
