
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-widest-line
_pkgname=${pkgname#*-}
pkgver=3.1.0
pkgrel=1
pkgdesc='Get the visual width of the widest line in a string.'
arch=('any')
url='https://github.com/sindresorhus/widest-line'
license=('MIT')
depends=('nodejs' 'nodejs-string-width')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('a3a58d82404a33fa1ec75f9d43b9b8f33a64a1468f6b74b5200dfabdecccd2c0')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

