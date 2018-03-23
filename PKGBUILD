# Maintainer: Rich Daley <rich at fishpercolator dot co dot uk>

_npmname=push-dir
pkgname=nodejs-$_npmname
pkgver=0.4.1
pkgrel=1
pkgdesc="Push the contents of a directory to a remote branch"
arch=('any')
url="https://github.com/L33T-KR3W/push-dir"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('69def951efc833a21f60108383742790f22e7147229837b6b698a6d67f62bc05')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
