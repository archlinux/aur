# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
_npmname=traceur
_npmver=0.0.111
pkgname=nodejs-traceur # All lowercase
pkgver=0.0.111
pkgrel=1
pkgdesc="ES6 to ES5 compiler"
arch=(any)
url=https://github.com/google/traceur-compiler
license=( "Apache" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('d75b4c0ae7690da4dd7d4db0250bd80a31d163910df35df24a7823ff6cf5b62f')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
}

# vim:set ts=2 sw=2 et:
