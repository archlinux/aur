# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=livereload
_npmver=0.6.0
pkgname=nodejs-${_npmname} # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="An implementation of the LiveReload server in Node.js"
arch=(any)
url="https://github.com/napcs/node-livereload/"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('ac02fe5b5e8b3ab768e14c7eb9bc6a9b0b37cef2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 cc=80 et:
