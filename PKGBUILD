# Maintainer: Majenko <matt@majenko.co.uk>
pkgname=ttynvt-git
pkgver=0.16
pkgrel=1
pkgdesc="Virtual Network Terminal supporting the Com Port Control Option (RFC2217)"
arch=('any')
url=https://gitlab.com/lars-thrane-as/ttynvt
license=('BSD')

source=("git+https://gitlab.com/lars-thrane-as/ttynvt")
cksums=(SKIP)

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
