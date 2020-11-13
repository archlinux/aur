
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-term-size
_pkgname=${pkgname#*-}
pkgver=2.2.1
pkgrel=1
pkgdesc='Reliably get the terminal window size.'
arch=('any')
url='https://github.com/sindresorhus/term-size'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('e58b9c4ce85bd5aece93bf5bc70e36f494202cdab742ce8606e7772e80457312')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

