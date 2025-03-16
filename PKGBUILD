# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=spivak
pkgver=2.1
pkgrel=1
pkgdesc="Karaoke player based on GStreamer and Qt6"
arch=(x86_64)
url="https://github.com/gyunaev/spivak"
license=(GPL3)
depends=(gst-plugins-base libzip qt6-base uchardet)
conflicts=(spivak-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gyunaev/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2899ade9bad5913977734dfad08da31a9c6935c4bfac155e2f56fdf5970bebe8'
            '2f2365bb82c3a8f026ea7a5f651d48bb14033cc09ff5169cf5fda2178729cea9')

build() {
	cd $pkgname-$pkgver
	qmake6
	make
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 src/spivak "$pkgdir/usr/bin/spivak"
	install -Dm644 packaging/spivak.desktop "$pkgdir/usr/share/applications/spivak.desktop"
	install -Dm644 packaging/spivak.png "$pkgdir/usr/share/pixmaps/spivak.png"
}
