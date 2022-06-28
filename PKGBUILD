# Maintainer: Davide Ferrero <bad dot deid at gmail dot com>
# Contributor: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Mark Pustjens <pustjens at dds dot nl>

_npmname=express
pkgname=nodejs-express
pkgver=4.18.1
pkgrel=1
pkgdesc="Fast, unopinionated, minimalist web framework for node."
arch=('any')
url="https://github.com/expressjs/express"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('8fc3ea14bf5b8670d828ed0b00ccbb00a57f7a8bacef507b4676be8bd8cfaa61')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
