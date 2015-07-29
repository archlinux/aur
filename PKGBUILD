# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=strongloop
pkgname=nodejs-$_npmname
pkgver=4.1.1
pkgrel=1
pkgdesc="Strongloop controller CLI"
arch=('any')
url="http://strongloop.com/"
license=('Artistic2.0')
depends=('nodejs')
makedepends=('npm' 'python2')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('39529c212c4ec3aaa4b3ea71a1cd4ade80cc9dd023a3e35354d55b684ad6f03e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  PYTHON=/usr/bin/python2 npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
