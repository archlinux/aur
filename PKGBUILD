# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=strongloop
pkgname=nodejs-$_npmname
pkgver=6.0.0
pkgrel=1
pkgdesc="Strongloop controller CLI"
arch=('any')
url="http://strongloop.com/"
license=('Artistic2.0')
depends=('nodejs')
makedepends=('npm' 'python2')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d1fad3747439a4018569e7fa844ab043d1979d653bd4356e1808aa902b2fa3f8')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  PYTHON=/usr/bin/python2 npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -r "$pkgdir"/usr/etc
}
