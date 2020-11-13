
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-boxen
_pkgname=${pkgname#*-}
pkgver=4.2.0
pkgrel=2
pkgdesc='Create boxes in the terminal.'
arch=('any')
url='https://github.com/sindresorhus/boxen'
license=('MIT')
depends=(
    'nodejs'
    'nodejs-ansi-align'
    'nodejs-string-width'
    'nodejs-camelcase'
    'nodejs-chalk'
    'nodejs-cli-boxes'
    'nodejs-term-size'
    'nodejs-type-fest'
    'nodejs-widest-line'
)
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sindresorhus/$_pkgname/archive/v$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('62d72593d1f1e7bf7ee34533e98246716a5c35c0afed78e410629b0ed0b623e1')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

