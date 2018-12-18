# Maintainer: misson20000 <xenotoad at xenotoad dot n e t>
pkgname=hactool-git
pkgver=1.0.1.r10.g41e6695
pkgrel=2
pkgdesc="hactool is a tool to view information about, decrypt, and extract common file formats for the Nintendo Switch, especially Nintendo Content Archives."
arch=("any")
url="https://github.com/SciresM/hactool"
license=("ISC")
groups=("base-devel")
depends=("gcc")
makedepends=("git")
provides=("hactool")
source=("git+https://github.com/SciresM/hactool.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/hactool"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/hactool"
	cp config.mk.template config.mk
	make
}

package() {
	install -D -t "$pkgdir/usr/bin" "$srcdir/hactool/hactool"
}
