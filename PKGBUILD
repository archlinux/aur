# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

_npmname=esformatter-jsx
pkgname=nodejs-$_npmname
pkgver=1.3.0
pkgrel=1
pkgdesc="format javascript files that contain React JSX blocks"
arch=(any)
url=https://github.com/royriojas/esformatter-jsx
license=(MIT)
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c52761456e03d10cfcab1984bd853c974e74978759e4469346e9c98f9766670a')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
