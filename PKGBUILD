# Maintainer: Brandon Mittman <brandonmittman@gmail.com>
_npmname=playball
_npmver=3.6.0
pkgname=playball
pkgver=3.6.0
pkgrel=1
pkgdesc="Watch MLB games from the comfort of your terminal"
arch=(any)
url="https://github.com/paaatrick/playball"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0cb2441f615f8fc27d41c4cfeee60fe8130d282c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
