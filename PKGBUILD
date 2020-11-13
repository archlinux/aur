
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-ansi-regex
_pkgname=${pkgname#*-}
pkgver=5.0.0
pkgrel=1
pkgdesc='Regular expression for matching ANSI escape codes'
arch=('any')
url='https://github.com/chalk/ansi-regex'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chalk/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('f50f18d89e81b834ebad89fa1dcbc1d1d77a5b22599636942f0dfaac2ad4fbef')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

