# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
_npmname=iothub-explorer
_npmver=1.2.0
pkgname=nodejs-${_npmname}
pkgver=${_npmver}
pkgrel=1
pkgdesc="A CLI tool to manage device identities in your IoT hub registry, send and receive messages and files from your devices, and monitor your IoT hub operations."
arch=(any)
url="https://github.com/Azure/iothub-explorer"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('fd65c9509dd22d6ad57a65aedb5ee8075f010aac')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
