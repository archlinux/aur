# Maintainer: Jonne Haß <me@jhass.eu>

_npmname=ember-cli
pkgname=nodejs-$_npmname
pkgver=4.0.1
pkgrel=1
pkgdesc="The ember command line interface"
arch=('any')
url="http://www.ember-cli.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2d02343b1294ccd686ebc875ec78591b25d0d6c14cc3653b0bd999623f163c8c')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --no-optional --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir" -type d -exec chmod 755 \{\} +
}
