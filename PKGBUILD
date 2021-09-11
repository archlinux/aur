# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=lean-language-server
pkgname=lean-language-server
pkgver=3.1.1
pkgrel=1
pkgdesc='Language Server Protocol implementation for the Lean theorem prover, version 3'
arch=('any')
url='https://github.com/leanprover/lean-client-js'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ac0240ee94043dd93c0e4bf897855f8b6433067a85bb88ae8965bcdcd8cfe5b4')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
