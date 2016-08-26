_npmname=shrinkpack
_npmver=0.17.0
pkgname=nodejs-shrinkpack
pkgver=0.17.0
pkgrel=1
pkgdesc="Fast, resilient, reproducible builds with npm install."
arch=(any)
url='https://github.com/JamieMason/shrinkpack'
license=('MIT')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('7824f6c24aa83aa572e353f91a9b038368780b7a8a81ac018b8879f286a53a03')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
