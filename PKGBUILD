# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj at vision-media dot ca>
# Contributor: Travis Jeffery <tj at travisjeffery dot com>

_npmname=mocha
pkgname=nodejs-mocha
pkgver=9.1.4
pkgrel=1
pkgdesc="Simple, flexible, fun JavaScript test framework for Node.js & The Browser"
arch=(any)
url="https://mochajs.org"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2ba113c7cfa244b931af38ee797a8c9e61fef0ab41cdf9c3b3f394d6ed759916')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
