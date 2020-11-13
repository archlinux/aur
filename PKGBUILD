
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-string-width
_pkgname=${pkgname#*-}
pkgver=4.2.0
pkgrel=2
pkgdesc='Get the visual width of a string.'
arch=('any')
url='https://github.com/sindresorhus/string-width'
license=('MIT')
depends=(
    'nodejs'
    'nodejs-emoji-regex'
    'nodejs-is-fullwidth-code-point'
    'nodejs-strip-ansi'
)
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('ed442beb06ff8beb24235a38af520b971befdfb68fba6ae7130cf7f402efc6d8')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

