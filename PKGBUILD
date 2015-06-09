# Maintainer Daichi Shinozaki <dsdseg@gmail.com>
_npmname=traceur
_npmver=0.0.89
pkgname=nodejs-traceur # All lowercase
pkgver=0.0.89
pkgrel=1
pkgdesc="ES6 to ES5 compiler"
arch=(any)
url=https://github.com/google/traceur-compiler
license=( "Apache" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('eaddbdaf619d4911b705591a8172533a44134afa')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
}

# vim:set ts=2 sw=2 et:
