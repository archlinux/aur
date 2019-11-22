# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=viper4linux-gui
pkgver=1.13
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('any')
url="https://github.com/ThePBone/Viper4Linux-GUI"
license=('GPL3')
depends=('viper4linux' 'qt5-base' 'mesa')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ThePBone/Viper4Linux-GUI/archive/$pkgver.tar.gz"
		"viper4linux-gui.desktop")
sha256sums=('f8b638f899f4622801ed96700ffc69256838871bae6808842d3e6c5cad4b81b9'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

build() {
	cd "Viper4Linux-GUI-$pkgver"
	qmake
	make PREFIX=/usr
}

package() {
	cd "Viper4Linux-GUI-$pkgver"
	install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
	install -Dm644 "$srcdir/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
