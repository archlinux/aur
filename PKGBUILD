# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj at vision-media dot ca>
# Contributor: Travis Jeffery <tj at travisjeffery dot com>

_npmname=mocha
pkgname=nodejs-mocha
pkgver=9.0.3
pkgrel=1
pkgdesc="Simple, flexible, fun JavaScript test framework for Node.js & The Browser"
arch=(any)
url="https://mochajs.org"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c22ac3aa91f5bf180a1f7bc2b7abb60fd3ad40def6c5fc34e151546619f21908')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
