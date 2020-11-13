
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-ansi-align
_pkgname=${pkgname#*-}
pkgver=3.0.0
pkgrel=1
pkgdesc='Align-text with ANSI support for CLIs.'
arch=('any')
url='https://github.com/nexdrew/ansi-align'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/nexdrew/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('edee2f3733ed7a1983f703f6fa4772a5278063df7bcff5bfab8bf1d9ccba97d0')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

