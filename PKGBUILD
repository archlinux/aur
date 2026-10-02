# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=trashbhuwan
pkgver=3.1.0
pkgrel=1
pkgdesc="Trashing CLI application for Linux distros, written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/tribhuwan-kumar/trashbhuwan"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e66b9fbe420cd4efa7e94a9d0ae24736f1e903e13a6b00603af81ae0e5dc37d6')

build() {
	cd "trashbhuwan-$pkgver"
	gcc $CFLAGS $CPPFLAGS $LDFLAGS trashbhuwan.c -o trashbhuwan-build
}

package() {
	cd "trashbhuwan-$pkgver"
	install -Dm755 trashbhuwan-build "$pkgdir/usr/bin/trashbhuwan"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
