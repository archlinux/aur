# Maintainer: Finley Vickers <fvickers05@gmail.com>
_npmname=wipeclean
_npmver=1.0.4
pkgname=wipeclean
pkgver=1.0.4
pkgrel=1
pkgdesc="clean the console in a funny way"
arch=(any)
url="https://github.com/JeanJouliaCode/wipeClean"
license=(ISC)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(3ae7b6682bda46c929efaebbb7fc58397250f09c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
