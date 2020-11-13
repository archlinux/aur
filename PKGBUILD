
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-is-fullwidth-code-point
_pkgname=${pkgname#*-}
pkgver=3.0.0
pkgrel=1
pkgdesc='Check if the character represented by a given Unicode code point is fullwidth'
arch=('any')
url='https://github.com/sindresorhus/is-fullwidth-code-point'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('ec125a33475157729216e222f1f300e5413b6815d8f6fe710a8372c3f211ea17')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

