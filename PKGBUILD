
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-strip-ansi
_pkgname=${pkgname#*-}
pkgver=6.0.0
pkgrel=2
pkgdesc='Strip ANSI escape codes from a string'
arch=('any')
url='https://github.com/chalk/strip-ansi'
license=('MIT')
depends=('nodejs' 'nodejs-ansi-regex')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/chalk/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('4ec0debe7b2d9935a0a6933ae6db8d3d9efc51e576abdd8b23857aa616e9ebeb')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

