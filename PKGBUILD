# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=crackle-git
pkgver=r100.ff47a48
pkgrel=1
pkgdesc="Crack and decrypt BLE encryption"
arch=('i686' 'x86_64')
url="http://lacklustre.net/projects/crackle/"
license=('BSD')
makedepends=('libpcap')
source=("${pkgname}::git+https://github.com/mikeryan/crackle")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "crackle" "${pkgdir}/usr/bin/crackle"
}
