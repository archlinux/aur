
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-color-name
_pkgname=${pkgname#*-}
pkgver=1.1.4
pkgrel=1
pkgdesc='A JSON with CSS color names.'
arch=('any')
url='https://github.com/colorjs/color-name'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/colorjs/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('cddf05f67ddc8d112ae0e60f4b52fa7e049d288635324b5fa5e385b7ade94fc7')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

