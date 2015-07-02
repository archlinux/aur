# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=http-server
pkgname=nodejs-$_npmname
pkgver=0.7.2
pkgrel=1
pkgdesc="A simple zero-configuration command-line http server"
arch=('any')
url="https://github.com/nodeapps/http-server"
license=('MIT')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('ff02e9338bfd9d3687668f090e088a7606eeb12e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
