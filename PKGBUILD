
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-has-flag
_pkgname=${pkgname#*-}
pkgver=4.0.0
pkgrel=1
pkgdesc='Check if argv has a specific flag.'
arch=('any')
url='https://github.com/sindresorhus/has-flag'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('ffdabbbfcc87e9e363c4a93df49dbec1a0cbff2a69ff22d0d435bdeaf0e78731')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

