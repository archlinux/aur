
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-ansi-styles
_pkgname=${pkgname#*-}
pkgver=4.3.0
pkgrel=1
pkgdesc='ANSI escape codes for styling strings in the terminal.'
arch=('any')
url='https://github.com/chalk/ansi-styles'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chalk/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('8454510b9ca987137f1718b05325be89f11903d347fd0ba7e8a091dc7061ff18')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

