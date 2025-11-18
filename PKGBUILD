# Maintainer: Hugo Sibony <kazetachinuu@protonmail.com>
pkgname=alias-manager
pkgver=2.1.3
pkgrel=1
pkgdesc="A lightweight CLI tool to manage your shell aliases efficiently"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/kazetachinuu/alias_manager"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('118a199775cc4cf2e637c88d975c8c83fd317fb34710ed6eab48a981104181a0')

build() {
    cd "alias_manager-$pkgver"
    make
}

package() {
    cd "alias_manager-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
