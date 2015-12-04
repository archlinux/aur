# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=strongloop
pkgname=nodejs-$_npmname
pkgver=5.0.1
pkgrel=1
pkgdesc="Strongloop controller CLI"
arch=('any')
url="http://strongloop.com/"
license=('Artistic2.0')
depends=('nodejs')
makedepends=('npm' 'python2')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('bcfb863e05d3c824d0713707db37fa7eb0c5899061b63f8cc9f99cefbb0f39f9')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  PYTHON=/usr/bin/python2 npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
