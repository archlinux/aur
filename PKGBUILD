_npmname=termcolors
pkgname=nodejs-termcolors
pkgver=0.2.16
pkgrel=1
pkgdesc="Convert terminal color schemes"
arch=(any)
url="https://github.com/stayradiated/termcolors"
license=(MIT)
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a68a0058c4dad32cab3e45684eae14fc14f45eb6d981f86e839bf837a46163f9')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
