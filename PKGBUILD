# Maintainer: Bango88 <fvickers05@gmail.com>
_npmname=wipeclean
_npmver=1.1.2
pkgname=wipeclean
pkgver=1.1.2
pkgrel=1
pkgdesc="clean the console in a funny way"
arch=(any)
url="https://github.com/JeanJouliaCode/wipeClean"
license=(ISC)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e1b71f66e7110ddfa6611cf557d8e3385781e677)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}
