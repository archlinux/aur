# Maintaner: sgerwk <sgerwk at aol dot com>
# package script file for archlinux
# makepkg -p THISFILE
pkgname=libllfat
pkgver=git
pkgrel=1
pkgdesc="library for low-level access to a FAT12/16/32 filesystem"
license=(GPL3)
arch=('x86_64' 'i686')
depends=(glibc)
makedepends=('gcc' 'make')
url="http://github.com/sgerwk/libllfat"
source=(git+https://github.com/sgerwk/libllfat)
sha256sums=('SKIP')

build() {
        cd "$pkgname"
	make || return 1
}

check() {
        cd "$pkgname"
	return $(test -x build/fattool)
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir" install || return 1
}

