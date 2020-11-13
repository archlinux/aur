
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-emoji-regex
_pkgname=${pkgname#*-}
pkgver=9.2.0
pkgrel=1
pkgdesc='Align-text with ANSI support for CLIs.'
arch=('any')
url='https://mths.be/emoji-regex'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mathiasbynens/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('02bc5e9016ecef3985e2c552a66e2684d1d8fbf9ef8b454d97b9911c31f253a2')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE-MIT.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

