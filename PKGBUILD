# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=lean-language-server
pkgname=lean-language-server
pkgver=3.4.0
pkgrel=1
pkgdesc='Language Server Protocol implementation for the Lean theorem prover, version 3'
arch=('any')
url='https://github.com/leanprover/lean-client-js'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0d53b0a075f3a03bf8333b26fdc0969d284ef6b47bb8ebcd97a298d05e5824d6')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
