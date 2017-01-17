# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_npmname=testee
_npmver=0.3.0
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
sha1sums=('1a28a5a8847baab5ce8cbde60e79e9fe11ea7cbe')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 cc=80 et:
