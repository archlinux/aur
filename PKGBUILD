# Submitter: kpcyrd <git@rxv.cc>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgbase=open-cobol
pkgname=('open-cobol')
pkgver=3.1.2
pkgrel=1
pkgdesc="COBOL compiler"
url="https://sourceforge.net/projects/gnucobol/files/gnucobol/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/gnucobol/files/gnucobol/3.1/gnucobol-${pkgver}.tar.xz/download")
license=("GPL")
depends=("db" "gmp" "json-c" "libxml2")
makedepends=("gcc")
md5sums=('720d8425e4ac30b83b84f43ef08f9558')
sha256sums=('597005d71fd7d65b90cbe42bbfecd5a9ec0445388639404662e70d53ddf22574')


build() {
	cd gnucobol-${pkgver}
	./configure --prefix=/usr --infodir=/usr/share/info
	make
}


package() {
	cd gnucobol-"$pkgver"
	make DESTDIR="$pkgdir" install
}


