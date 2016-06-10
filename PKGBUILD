# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=bunyan
pkgname=nodejs-$_npmname
pkgver=1.8.1
pkgrel=1
pkgdesc="A simple and fast JSON logging module for node.js services."
arch=('any')
url='https://github.com/trentm/node-bunyan'
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d35b9a8a68d526e854088891b1f3ddb8578d0d5d891174acb082cffeca1def90')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
