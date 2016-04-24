# Maintainer: Ordoe ordoe <aur@cach.co>

_npmname=meteor-build-client
_npmver=0.3.0
pkgname=meteor-build-client
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to bundle the client part of a Meteor app."
arch=(any)
url="https://github.com/frozeman/meteor-build-client#readme"
license=()
depends=('meteor-js' 'nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('06e48214cc8989ecb501f9781a53f16d6ac8879297e9cb5fe648f7d628f0bf08')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
