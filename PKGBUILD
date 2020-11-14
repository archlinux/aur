# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=bunyan
pkgname=nodejs-$_npmname
pkgver=2.0.4
pkgrel=1
pkgdesc="A simple and fast JSON logging module for node.js services."
arch=('any')
url='https://github.com/trentm/node-bunyan'
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('941925b4d696d74ec99e2d12f19ac4522c86acb833177e9d9c0fcb4e181acb21')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
