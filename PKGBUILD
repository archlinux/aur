# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=0.4.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64' 'i686')
url="https://people.gnome.org/~ole/girl/"
license=('GPL')
depends=('libchamplain' 'gst-plugins-bad')
makedepends=('intltool' 'itstool')
options=('!emptydirs')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('335ecc3a181f12f4be01e73f7681640665e5fd7032308e579e1af11f0c46dace')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
