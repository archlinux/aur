# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=strongloop
pkgname=nodejs-$_npmname
pkgver=5.0.0
pkgrel=1
pkgdesc="Strongloop controller CLI"
arch=('any')
url="http://strongloop.com/"
license=('Artistic2.0')
depends=('nodejs')
makedepends=('npm' 'python2')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('281a2a62b0de3c2ddee4936817cb2f91cd59d03ca30a5e7d9abde7791b02226b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  PYTHON=/usr/bin/python2 npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
