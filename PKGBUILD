# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=office-runner
pkgver=1.0.2
pkgrel=1
pkgdesc="Office game for laptop owners"
arch=('x86_64' 'i686')
url="https://git.gnome.org/browse/office-runner/"
license=('GPL')
depends=('gnome-settings-daemon')
makedepends=('intltool')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('ea42d84960773bd3ec7bb412df61cbfb617a42f69db09ed337eef91ff94a8a97')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
