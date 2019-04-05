# Maintaner: sgerwk <sgerwk at aol dot com>
# package script file for archlinux
# makepkg -p THISFILE
pkgname=libllfat
pkgver=0.1.6
pkgrel=1
pkgdesc="library for low-level access to a FAT12/16/32 filesystem"
license=(GPL3)
arch=('x86_64' 'i686')
depends=(glibc)
makedepends=('gcc' 'make')
url="http://github.com/sgerwk/libllfat"
source=("$pkgname-$pkgver.tar.gz::https://github.com/sgerwk/libllfat/archive/v$pkgver.tar.gz")
sha256sums=('3fbce9a1c31ab5cfe1696766430952ac286c9f3b3ca32d5fc24479c2b3c7d01f')

build() {
        cd "$pkgname-$pkgver"
	make || return 1
}

check() {
        cd "$pkgname-$pkgver"
	return $(test -x build/fattool)
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install || return 1
}

