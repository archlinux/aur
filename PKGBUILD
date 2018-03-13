# Maintainer: Zakary Kamal Ismail <zakary.kamal.fs@outlook.com>
pkgname=rust-qt-binding-generator-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Generates Qt binding for Rust code from a JSON file"
arch=('any')
url="https://github.com/KDE/rust-qt-binding-generator"
license=('GPLv2')
depends=('qt5-base' 'qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('git' 'cmake' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+http://github.com/KDE/${pkgname%-git}.git")
md5sums=(SKIP)

prepare() {
	cd $srcdir/${pkgname%-git}
}
build() {
	cd $srcdir/${pkgname%-git}

	mkdir build
	cd build

	cmake ..
	make
}

check() {
	cd $srcdir/${pkgname%-git}
}

package() {
	cd $srcdir/${pkgname%-git}/build
	make DESTDIR="$pkgdir/" install
}
