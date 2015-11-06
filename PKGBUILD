# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=2.3.2
pkgrel=1
pkgdesc="Traditional CLI for postcss."
arch=('any')
url="https://github.com/code42day/postcss-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('72b03b898ab8d4b4e1222d58d5cda150a1a7978bde35d96b6781f2daf511a1de')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
