# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=cmake-js
pkgname=nodejs-cmake-js
pkgver=6.1.0
pkgrel=2
pkgdesc="CMake.js - a Node.js native addon build tool"
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('2e6f50acd31e38493e5047174f8de0398fc4157d7b861f00f81a48d41fd91349')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
