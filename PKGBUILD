# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=woeusb
pkgver=3.2.10
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/slacka/WoeUSB/archive/v$pkgver.tar.gz")
sha256sums=('4cfe2338c2d3faac83fe4ea6d3ac0b0d0d51b95d021ec80d33fcb6c0e81d5567')

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

