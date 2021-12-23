_npmname=termcolors
pkgname=nodejs-termcolors
pkgver=0.7.3
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
sha256sums=('fea0b9ce40e2c3df329d53ee1e418bfc0abab9bfe94596ac571b7f2748ed16e9')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
