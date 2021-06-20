# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Mark Pustjens <pustjens at dds dot nl>

_npmname=express
pkgname=nodejs-express
pkgver=4.17.1
pkgrel=1
pkgdesc="Fast, unopinionated, minimalist web framework for node."
arch=('any')
url="https://github.com/expressjs/express"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2600b551c4e3f56d1bd5e28505d4ecfe3e73e58cc3a0ad5be08c0bf395aa02a9')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
