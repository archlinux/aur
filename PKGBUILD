# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=xqilla
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc="An XQuery and XPath 2.0 library, written in C++ and built on top of Xerces-C."
arch=("any")
url="http://xqilla.sourceforge.net/"
license=("GPL3")
groups=()
depends=("xerces-c")
provides=("xqilla")
backup=()
changelog=
source=("http://downloads.sourceforge.net/project/xqilla/XQilla-2.3.2.tar.gz"
        "https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.2.tar.gz")
noextract=()
sha256sums=("5ae0aed4091521d5c2f541093e02a81ebe55a9087ba735f80b110068584e217c"
			"743bd0a029bf8de56a587c270d97031e0099fe2b7142cef03e0da16e282655a0")

build() {
	cd XQilla-2.3.2
	./configure --with-xerces=`pwd`/../xerces-c-3.1.2/
	make
}

package() {
	cd XQilla-2.3.2
	make DESTDIR="$pkgdir/" install
}
