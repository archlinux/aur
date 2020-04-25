# Maintainer: Mario Moura <mario.henrique@protonmail.com>
pkgname=packit
pkgver=1.7
pkgrel=1
pkgdesc="network packet generator and capture tool"
arch=('any')
url="https://github.com/resurrecting-open-source-projects/packit"
license=('GPL2')
depends=('libnet>=1.1.2' 'libpcap>=0.8')
makedepends=('git')
changelog=Changelog
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make check
}

package() {
	cd "$pkgname"
	./install-sh -t $pkgdir/ src/packit
}
