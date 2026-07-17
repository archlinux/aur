# Maintainer: Majenko <matt@majenko.co.uk>
pkgname=ttynvt-git
pkgver=0.17.r4.ge9533b1
pkgrel=1
pkgdesc="Virtual Network Terminal supporting the Com Port Control Option (RFC2217)"
arch=('any')
url=https://gitlab.com/lars-thrane-as/ttynvt
license=('BSD')

source=("git+https://gitlab.com/lars-thrane-as/ttynvt")
cksums=(SKIP)

pkgver() {
	cd "ttynvt"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "ttynvt"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "ttynvt"
    make DESTDIR="$pkgdir/" install
}
