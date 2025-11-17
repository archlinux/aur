# Maintainer: Hugo Sibony <kazetachinuu@protonmail.com>
pkgname=alias-manager
pkgver=2.1.0
pkgrel=1
pkgdesc="A lightweight CLI tool to manage your shell aliases efficiently"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/kazetachinuu/alias_manager"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ee6bf1ac9a2283b067ef04765190d732d3c382b36f9b412c5bf91f673afec6f')

build() {
    cd "alias_manager-$pkgver"
    make
}

package() {
    cd "alias_manager-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
