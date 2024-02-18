# Maintainer: piernov <piernov@piernov.org>

pkgname=atomdis-git
pkgver=r55.de3760c
pkgrel=1
pkgdesc="AtomBIOS disassembler + data structure dumper"
arch=('x86_64')
url="https://cgit.freedesktop.org/~mhopf/AtomDis/"
license=('GPL-2.0')
source=('git://people.freedesktop.org/~mhopf/AtomDis')
sha256sums=('SKIP')

pkgver() {
	cd "AtomDis"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "AtomDis"
	make
}

package() {
	cd "AtomDis"
	install -Dm755 "${srcdir}/AtomDis/atomdis" "${pkgdir}/usr/bin/atomdis"
}
