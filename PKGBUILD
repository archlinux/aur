# Maintainer: Hugo Sibony <kazetachinuu@protonmail.com>
pkgname=alias-manager
pkgver=2.3.1
pkgrel=1
pkgdesc="Lightweight CLI tool for managing shell aliases"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/kazetachinuu/alias_manager"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ae31d1ef0999406e42b6921fd4580bd9aba0f3d67139321bc5621bfd1ff0b9d')

build() {
    cd "alias_manager-$pkgver"
    make
}

package() {
    cd "alias_manager-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
