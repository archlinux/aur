# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: sum01 <sum01@protonmail.com>

pkgname=nodejs-lua-fmt
_npmname="lua-fmt"
pkgver=2.6.0
pkgrel=3
pkgdesc="A pretty-printer for Lua code"
arch=(any)
url="https://github.com/trixnz/lua-fmt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2b7f826dfb038569d37421dbc9f12cb2f7ecc4643a914647f0e379676c77ef7a')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
