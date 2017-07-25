# Maintainer: Afri 5chdn <aur@5chdn.co>

_npmname=meteor-build-client
_npmver=0.4.1
pkgname=meteor-build-client
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool to bundle the client part of a Meteor app."
arch=(any)
url="https://github.com/frozeman/meteor-build-client#readme"
license=()
depends=('meteor-js' 'nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('781fa9a2962525c7420f4a9f043ddf300441e9c0ec1d1f2fce493213f421cfa1')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
