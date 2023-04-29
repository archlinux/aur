# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=crackle-git
pkgver=0.1.r86.gd83b4b6
pkgrel=2
pkgdesc="Crack and decrypt BLE encryption"
arch=('i686' 'x86_64')
url="http://lacklustre.net/projects/crackle/"
license=('BSD')
makedepends=('libpcap')
source=("${pkgname}::git+https://github.com/mikeryan/crackle")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "crackle" "${pkgdir}/usr/bin/crackle"
}
