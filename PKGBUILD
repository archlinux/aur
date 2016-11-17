# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=knex
pkgname=nodejs-$_npmname
pkgver=0.12.6
pkgrel=1
pkgdesc="A query builder for PostgreSQL, MySQL and SQLite3, designed to be flexible, portable, and fun to use."
arch=('any')
url="http://knexjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f35cefad7b73ea3f93c9665c2f6b993309477e9e0c31807472f39ee1fc297402')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
