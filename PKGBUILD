# Maintainer: gbletr42 <gbletr42@gmail.com>
_pkgname="wirehair"
pkgname="wirehair-git"
pkgver=r1.557c00c
pkgrel=1
pkgdesc="O(N) Fountain Code for Large Data"
arch=('i686' 'x86_64')
url="https://github.com/catid/wirehair"
license=('BSD-3-Clause')
makedepends=('git' 'cmake')
source=('git+https://github.com/catid/wirehair.git')
sha256sums=('SKIP')
provides=(wirehair)
conflicts=(wirehair)

build() {
	cd $_pkgname
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DBUILD_SHARED_LIBS=1 -S . -B build
	make -C build
}

package() {
	cd $_pkgname
	make -C build install DESTDIR="$pkgdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

