
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-telegraf
_pkgname=${pkgname#*-}
pkgver=3.38.0
pkgrel=1
pkgdesc='Modern Telegram Bot Framework for Node.js'
arch=('any')
url='https://telegraf.js.org/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/telegraf/$_pkgname/archive/$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('a4cd265cb1aefd84c57a2d47ac0028d18bba471cb47dbbbcd44c69703c81b022')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

