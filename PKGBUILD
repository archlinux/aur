# Maintainer: Finitodoer <finitodoer@nospam.com>
pkgname=finitodo
pkgver=2.0
pkgrel=9
pkgdesc="Finitodo is a graphical task/todo list manager for Linux that aims to be highly versatile yet not overly complicated. It has robust functionality in areas like reccurence/sorting/filtering but doesn't require digging through lots of menu screens to use."
arch=(x86_64)
url="https://gitlab.com/finitodo/finitodo"
license=('GPL')
depends=(gtk3)
makedepends=(git make)
optdepends=()
provides=(finitodo)
source=('git+https://gitlab.com/finitodo/finitodo.git')
md5sums=('SKIP')

build() {
	cd finitodo
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m 755 finitodo/finitodo "${pkgdir}/usr/bin"
	install finitodo/Bin/finitodo.desktop "${pkgdir}/usr/share/applications"
}
