# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=cmake-js
pkgname=nodejs-cmake-js
pkgver=6.2.0
pkgrel=1
pkgdesc="CMake.js - a Node.js native addon build tool"
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('b01a5349992fbf4a8db0554ab224378b5ae0642a1153dfe77dfdad3722f05b1e')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
