_npmname=hotel
_npmver=0.8.6
pkgname=nodejs-hotel
pkgver=0.8.6
pkgrel=1
pkgdesc="A simple process manager for developers. Start apps from your browser and access them using local domains."
arch=(any)
url="https://github.com/typicode/hotel"
license=("MIT")
depends=("nodejs")
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('3a66b01ce6dcdf5cd2a9a09e33d01c9455abb949')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
