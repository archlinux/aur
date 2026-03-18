pkgname=bonsai
pkgver=2.0.1
pkgrel=6
pkgdesc="Terminal-based disk usage analyzer, TUI remake of GNOME Baobab"
arch=('x86_64')
url="https://github.com/LittleBigOwI/bonsai.git#branch=main"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'gcc' 'git' 'xdd')
source=(git+"$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	mkdir build
	
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$pkgname"
	install -Dm755 ./build/bonsai "$pkgdir/usr/bin/bonsai"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}