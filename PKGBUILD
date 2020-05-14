# Maintainer: John Lindgren <john@jlindgren.net>

pkgname=qmpanel
pkgver=0.1
pkgrel=1
pkgdesc="A Minimal Qt-Based Desktop Panel"
arch=("x86_64")
url="https://github.com/jlindgren90/qmpanel"
license=("LGPL2.1")
makedepends=("cmake")
depends=(
	"glib2"
	"kwindowsystem"
	"libxcb"
	"libxcomposite"
	"libxdamage"
	"libxrender"
)

source=("https://github.com/jlindgren90/qmpanel/archive/qmpanel-$pkgver.tar.gz")
sha256sums=("b19b824522f8f9dfe7e78d5a984641d80eee8ff9e6a389fd9d1b4a016ca50946")

build() {
	mkdir -p ../build
	cd ../build
	cmake "$srcdir"/qmpanel-qmpanel-"$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ../build
	make DESTDIR="$pkgdir" install
}
