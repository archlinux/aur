# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jdsp4linux-gui
pkgver=1.1
pkgrel=1
pkgdesc="User Interface for JamesDSP on Linux"
arch=('x86_64')
url="https://github.com/ThePBone/JDSP4Linux-GUI"
license=('GPL3')
depends=('jdsp4linux' 'qt5-multimedia' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('53f5975582ff152063bd69866d68343eadd5ef77d39e8278c67968bfdd3943d6'
            'fa8ed0bee321c7fed6d2368d0bdf6fd12a3318e324bbda50ec6dbe7e3b784794')

build() {
	cd "JDSP4Linux-GUI-$pkgver"
	qmake
	make PREFIX=/usr
}

package() {
	cd "JDSP4Linux-GUI-$pkgver"
	install -Dm755 jdsp-gui -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 icons/icon.png \
		"$pkgdir/usr/share/pixmaps/jdsp-gui.png"
}
