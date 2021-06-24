# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=wintersmith
pkgname=nodejs-wintersmith
pkgver=2.5.0
pkgrel=2
pkgdesc="A flexible static site generator."
arch=('any')
url="https://github.com/jnordberg/wintersmith"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('6232c6dfa128dc4d8fea2cef4aff55eb8b4fd3dc56d2d728a38f814c32475e83')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    chown -R root:root "${pkgdir}"
}
