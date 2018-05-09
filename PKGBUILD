# Maintainer: Bennett Piater <bennett at piater dot name>

_npmname=hueadm
pkgname=nodejs-$_npmname # All lowercase
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI to control Philips HUE lights"
arch=(any)
url="https://github.com/bahamas10/hueadm"
license=(MIT)
makedepends=('npm')
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('b8ab04acc87894237bcdaadb73bbb8a3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:

