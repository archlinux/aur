# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=tape
pkgname=nodejs-$_npmname
pkgver=4.5.1
pkgrel=1
pkgdesc="Tap-producing test harness for node and browsers."
arch=('any')
url="https://github.com/substack/tape"
license=('MIT')
depends=('nodejs' 'npm' )
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e932942c5f13d23edb2024e8f50d7e73950e993d2a88cce360731f935e429423')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
}
