# Maintainer: Oliver Anhuth <oliver.anhuth@web.de>

_npmname=neon-cli
pkgname=nodejs-$_npmname
pkgver=0.9.1
pkgrel=0
pkgdesc="The Neon Command-Line Tool: Build native Node.js plugins with Rust."
arch=('any')
url="https://neon-bindings.com/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('e62527be988e5854d6e342d28365d2eb6dbb28db')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
