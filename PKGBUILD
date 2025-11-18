# Maintainer: Hugo Sibony <kazetachinuu@protonmail.com>
pkgname=alias-manager
pkgver=2.1.2
pkgrel=1
pkgdesc="A lightweight CLI tool to manage your shell aliases efficiently"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/kazetachinuu/alias_manager"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d999a939b6277beb6b4869fe536e450ace30cd5dee3336286685083583fb52ff')

build() {
    cd "alias_manager-$pkgver"
    make
}

package() {
    cd "alias_manager-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
