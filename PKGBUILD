# Maintainer: Ordoe ordoe <aur@cach.co>

_npmname=meteor-build-client
_npmver=0.1.9
pkgname=nodejs-meteor-build-client # All lowercase
pkgver=0.1.9
pkgrel=1
pkgdesc="A bundles the client part of a Meteor app."
arch=(any)
url="https://github.com/frozeman/meteor-build-client#readme"
license=()
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(eb172750acf28fd109ac23bf2a5965bbdb9500bd)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
