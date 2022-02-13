# Maintainer: Kaan Genc <aur@kaangenc.me>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=bunyan
pkgname=nodejs-$_npmname
pkgver=2.0.5
pkgrel=1
pkgdesc="A simple and fast JSON logging module for node.js services."
arch=('any')
url='https://github.com/trentm/node-bunyan'
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ae158b859fe22602c35ba869e4859bb875163103701d7952e4d00aec63e6b699')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
