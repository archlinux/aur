
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-chalk
_pkgname=${pkgname#*-}
pkgver=4.1.0
pkgrel=2
pkgdesc='Terminal string styling done right.'
arch=('any')
url='https://github.com/chalk/chalk'
license=('MIT')
depends=('nodejs' 'nodejs-ansi-styles' 'nodejs-supports-color')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chalk/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('3ce085943ea0bdaa5829c43c85e224004c36dd11f8823f2828a1f869493b5168')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

