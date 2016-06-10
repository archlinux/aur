# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=knex
pkgname=nodejs-$_npmname
pkgver=0.11.5
pkgrel=1
pkgdesc="A query builder for PostgreSQL, MySQL and SQLite3, designed to be flexible, portable, and fun to use."
arch=('any')
url="http://knexjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2585760c79b3b7ddb43016a96ba704ea6f2c794f4e25d649ec050c9d1a60625b')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
