# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=jdsp4linux-gui
pkgver=1.0
pkgrel=1
pkgdesc="User Interface for JamesDSP on Linux"
arch=('x86_64')
url="https://github.com/ThePBone/JDSP4Linux-GUI"
license=('GPL3')
depends=('jdsp4linux' 'qt5-multimedia' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('d718384b13e650d974d092a6c7e181e0ff42215e22d9db05c1a181da72575f6d'
            'fa8ed0bee321c7fed6d2368d0bdf6fd12a3318e324bbda50ec6dbe7e3b784794')

build() {
	cd "JDSP4Linux-GUI-$pkgver"
	qmake
	make PREFIX=/usr
}

package() {
	cd "JDSP4Linux-GUI-$pkgver"
	install -Dm755 jdsp-gui "$pkgdir/usr/bin/jdsp-gui"
	install -Dm644 "$srcdir/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 icons/icon.png \
		"$pkgdir/usr/share/pixmaps/jdsp-gui.png"
}
