
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-color-convert
_pkgname=${pkgname#*-}
pkgver=2.0.1
pkgrel=2
pkgdesc='Plain color conversion functions in JavaScript.'
arch=('any')
url='https://github.com/Qix-/color-convert'
license=('MIT')
depends=('nodejs' 'nodejs-color-name')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Qix-/$_pkgname/archive/$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('9cfbd705bb3db600a9b1b61a55bc1e36f10636682e0f5ffa88ab9162eaa9acd0')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

