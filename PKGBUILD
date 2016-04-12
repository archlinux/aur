# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=knex
pkgname=nodejs-$_npmname
pkgver=0.10.0
pkgrel=1
pkgdesc="A query builder for PostgreSQL, MySQL and SQLite3, designed to be flexible, portable, and fun to use."
arch=('any')
url="http://knexjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('89f98ad003b6eceacbd4005b7e6f4ca5cb1cbd47610ed16665b7a4119340376e')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
