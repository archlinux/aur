# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>

_npmname=gitbook-cli
_npmver=2.3.2
pkgname=nodejs-gitbook-cli # All lowercase
pkgver="$_npmver"
pkgrel=3
pkgdesc="CLI to generate books and documentation using gitbook"
arch=(any)
url="https://www.gitbook.com"
license=()
depends=('nodejs' 'npm')
optdepends=('nodejs-svgexport')
conflicts=('nodejs-gitbook')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('e11af44f5d5b4491b242e81b1b3bffd356164ae7b46f4dbc21746cf8e07bac90')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
