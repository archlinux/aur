# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=xxoff-phonepi
pkgver=1
pkgrel=8
pkgdesc="Shutdown application for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("qt5-base" "qt5-tools" "qt5-declarative" "qt5-wayland")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/XXoff"
	qmake
	make
}

package() {
	cd "$srcdir/Phone/src/XXoff"
	install -Dm755 "./xxoff" "$pkgdir/usr/bin/xxoff"
}
