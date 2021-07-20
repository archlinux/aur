# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=cmake-js
pkgname=nodejs-cmake-js
pkgver=6.2.1
pkgrel=1
pkgdesc="CMake.js - a Node.js native addon build tool"
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('06e658fef59c65b9011bb2fb1a395c4406f5c65e28b0bd36accee22fc36e3492')
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
