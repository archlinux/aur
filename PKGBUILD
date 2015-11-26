# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=sequelize-cli
pkgname=nodejs-$_npmname
pkgver=2.2.1
pkgrel=1
pkgdesc="The sequelize CLI."
arch=('any')
url="http://sequelizejs.com"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c8a39ce8d65e9500af47142b338d7f336fd41366513715aef5b57454cc70765d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
