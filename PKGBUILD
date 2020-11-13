
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-type-fest
_pkgname=${pkgname#*-}
pkgver=0.18.1
pkgrel=1
pkgdesc='A collection of essential TypeScript types.'
arch=('any')
url='https://github.com/sindresorhus/type-fest'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('8597fdbe83a49a997390844ba99778621678ed01d17448874eea67c4fd436e66')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

