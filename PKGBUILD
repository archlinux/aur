# Maintainer: Ordoe ordoe <aur@cach.co>

_npmname=meteor-build-client
_npmver=0.2.2
pkgname=meteor-build-client
pkgver=0.2.2
pkgrel=1
pkgdesc="A tool to bundle the client part of a Meteor app."
arch=(any)
url="https://github.com/frozeman/meteor-build-client#readme"
license=()
depends=('meteor-js' 'nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('54035ef9aeecdf2b0de28cd8adbd6b2cac13e5d67855d4c71e6cc01734d6e547')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
