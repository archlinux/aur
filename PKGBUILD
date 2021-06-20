# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: Jian Zeng <anonymousknight96+aur AT gmail.com>

_npmname=ts-node
pkgname=nodejs-ts-node
pkgver=10.0.0
pkgrel=1
pkgdesc='TypeScript execution and REPL for node.js'
arch=('any')
url='https://github.com/TypeStrong/ts-node'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('43b5ebb7a1d20d0802ef954675a855a3797a4b5c2e0d632456ae0993eabfb639')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
