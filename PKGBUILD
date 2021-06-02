# Maintainer: torvic9 <torvic9 AT mailbox DOT org>
# fork of kmozillahelper
# to be used together with plasmafox

pkgname=kplasmafoxhelper
pkgver=5.0.6
pkgrel=1
pkgdesc="Plasmafox KDE Integration (kmozillahelper fork from openSUSE)."
url="https://github.com/openSUSE/kmozillahelper"
arch=("x86_64")
license=('MIT')
depends=("kio" "knotifications" "kwindowsystem" "ki18n")
makedepends=("cmake" "extra-cmake-modules" "git")
source=("git+https://gitlab.com/torvic9/kplasmafoxhelper.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release ../${pkgname}
	make
}

package() {
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
