# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=whatsappqt
pkgver=1.0.3
pkgrel=1
pkgdesc='Unofficial WhatsApp Web desktop client'
arch=('x86_64')
url='https://gitlab.com/bit3/whatsappqt'
license=('MIT')
depends=('qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5ffc915341ce64e323f88c6b2f098555c601d202b4023e1b6c44c38967e2a713')

build() {
	cd $pkgname-v$pkgver
	qmake-qt5 PREFIX=/usr
	make
}

package() {
	cd $pkgname-v$pkgver
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
