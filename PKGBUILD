# Maintainer: Aiden <univ.aur@gmail.com>
pkgname=xelector
pkgver=1.2.2
pkgrel=1
pkgdesc="A TUI for managing desktop environments"
arch=('x86_64')
url="https://codeberg.org/univ/Xelector"
license=('GPL-2.0-only')
depends=('glibc' 'ncurses' 'gcc-libs')
makedepends=('gcc' 'make')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d173b55c92381cbb1ab83dc3629f8b7c3f17ecc25f7873fb6efacebb962768c1')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
