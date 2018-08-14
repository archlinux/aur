# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=woeusb
pkgver=3.2.2
pkgrel=1
pkgdesc="A Linux program to create Windows USB stick installer from a real Windows DVD or an image"
arch=('x86_64')
url="https://github.com/slacka/WoeUSB"
license=('GPL3')
depends=('wxgtk2' 'grub' 'dosfstools' 'parted' 'wget' 'ntfs-3g')
optdepends=('gksu')
makedepends=('git')
conflicts=('woeusb-git')
provides=('woeusb-git')
source=("$pkgname-$pkgver::https://github.com/slacka/WoeUSB/archive/v$pkgver.tar.gz")
sha256sums=('472746470e7874c81a72d5189f3d1fa9004ba1ea1d3c9715e78b64cbf8fc0948')

prepare() {
	cd "WoeUSB-$pkgver"
	autoreconf --install
}

build() {
	cd "WoeUSB-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "WoeUSB-$pkgver"
	make DESTDIR="$pkgdir/" install
}

