# Maintainer: LinuxCoder <linuxcoder at linuxcoder dot nl>
pkgname=hearts
pkgver=1.6
pkgrel=1
pkgdesc="An implementation of the 'Hearts' card game"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Rescator7/Hearts"
license=("MIT")
depends=("qt5-base" "allegro")
makedepends=("qt5-tools")
source=("https://github.com/Rescator7/Hearts/archive/refs/tags/v1.6.tar.gz"
        "hearts.desktop")
md5sums=('8b4ff188b7b490f1d19fe4caae32090e'
         '59b0cbdacbde0ac4346a047bca9f0832')

build() {
	cd "Hearts-$pkgver"
	qmake Hearts.pro
	make
}

package() {
	install -m755 -D $srcdir/Hearts-$pkgver/Hearts $pkgdir/usr/bin/hearts
	install -m644 -D $srcdir/Hearts-$pkgver/icons/heart.png $pkgdir/usr/share/pixmaps/hearts.png
	install -m644 -D $srcdir/hearts.desktop $pkgdir/usr/share/applications/hearts.desktop
}
