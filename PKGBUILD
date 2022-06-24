# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=lean-language-server
pkgname=lean-language-server
pkgver=3.3.1
pkgrel=1
pkgdesc='Language Server Protocol implementation for the Lean theorem prover, version 3'
arch=('any')
url='https://github.com/leanprover/lean-client-js'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b8b210bf70c8284b3569f2b31b73edb44633f9988bc1b468f2dcbe1f2166853c')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
