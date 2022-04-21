# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=lean-language-server
pkgname=lean-language-server
pkgver=3.2.0
pkgrel=1
pkgdesc='Language Server Protocol implementation for the Lean theorem prover, version 3'
arch=('any')
url='https://github.com/leanprover/lean-client-js'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('dd5686fe0d750a5b71118b6605b8d8b62f00cd5e57ea582f536b15653df85ed1')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
