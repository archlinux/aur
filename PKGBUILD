
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-supports-color
_pkgname=${pkgname#*-}
pkgver=7.2.0
pkgrel=2
pkgdesc='Detect whether a terminal supports color.'
arch=('any')
url='https://github.com/chalk/supports-color'
license=('MIT')
depends=('nodejs' 'nodejs-has-flag')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chalk/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('e0d36c2eda8c1da9ba2b2829631bf7dbc3a9d0ef48fbf8553719fdeb3cc92f0f')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

