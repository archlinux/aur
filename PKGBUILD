# Maintainer: Hugo Sibony <kazetachinuu@protonmail.com>
pkgname=alias-manager
pkgver=2.2.0
pkgrel=1
pkgdesc="Lightweight CLI tool for managing shell aliases"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/kazetachinuu/alias_manager"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5cbc443adb31552d6d1b73c857c6d62be390aa9ee8b16d4c49aa4893f03fd374')

build() {
    cd "alias_manager-$pkgver"
    make
}

package() {
    cd "alias_manager-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
