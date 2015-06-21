# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=strongloop
pkgname=nodejs-$_npmname
pkgver=4.0.5
pkgrel=1
pkgdesc="Strongloop controller CLI"
arch=('any')
url="http://strongloop.com/"
license=('Artistic2.0')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1a4e3b98b6d146ad6c6e991f8e41ccf1ef9f457ca6d561cfa5f3add74bc70d1e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  PYTHON=/usr/bin/python2 npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
