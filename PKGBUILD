# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=2.1.0
pkgrel=1
pkgdesc="Traditional CLI for postcss."
arch=('any')
url="https://github.com/code42day/postcss-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1faa05e7ede18d4611602d973202899238f5ab1cbe5c3f00249b72d98e6af2c2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
