# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=node.io
pkgname=nodejs-node.io # All lowercase
pkgver=0.5.1
pkgrel=1
pkgdesc="A distributed data scraping and processing framework"
arch=('any')
url="http://github.com/chriso/node.io"
license=(MIT)
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('9fabd09a065decaf6ae59b87abd2a42d90fe1ea5')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
