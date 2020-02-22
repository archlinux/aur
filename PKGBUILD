# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-gui
pkgver=1.14
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('any')
url="https://github.com/ThePBone/Viper4Linux-GUI-Legacy"
license=('GPL3')
depends=('viper4linux' 'qt5-base' 'mesa')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
		"viper4linux-gui.desktop")
sha256sums=('2cc5c1e391eef27ae2f75ac0bd6300ea140cae735e8788717e4ea909c46bf133'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

build() {
	cd "Viper4Linux-GUI-Legacy-$pkgver"
	qmake
	make PREFIX=/usr
}

package() {
	cd "Viper4Linux-GUI-Legacy-$pkgver"
	install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
