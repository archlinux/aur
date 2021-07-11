# Maintainer: ern <ern8642@gmail.com>
pkgname=qtext
pkgver=0.40
pkgrel=1
pkgdesc="A simple, fast and opensource text editor"
arch=('x86_64')
url="https://github.com/ern126/qtext"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ern126/qtext/archive/v$pkgver.tar.gz")
md5sums=('d0899b777a8a83e9e63975dbc7d29edc')

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	install -Dm755 qtext  "${pkgdir}/usr/bin/qtext"
	cd ..
	install -Dm644 assets/applications/qtext.desktop "${pkgdir}/usr/share/applications/qtext.desktop"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/qtext/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/qtext/LICENSE"
	install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/qtext/CONTRIBUTING.md"
}
