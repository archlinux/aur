
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-cli-boxes
_pkgname=${pkgname#*-}
pkgver=2.2.1
pkgrel=1
pkgdesc='Boxes for use in the terminal.'
arch=('any')
url='https://github.com/sindresorhus/cli-boxes'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('4c07409e120a8713347503ba7a3c567b20b3df12ea8d1cd5377b5ede764402fc')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

