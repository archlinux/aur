
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-camelcase
_pkgname=${pkgname#*-}
pkgver=6.2.0
pkgrel=1
pkgdesc='Convert a dash/dot/underscore/space separated string to camelCase.'
arch=('any')
url='https://github.com/sindresorhus/camelcase'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('17e74571ccbf2521c2dfc22427c594cfe434e27bc78a410c5e7c33128f17b04b')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

