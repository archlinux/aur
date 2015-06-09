# Maintainer: Don Harper <duck at duckland dot org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: froggie <sullivanva@gmail.com>

pkgname=xlhtml
pkgver=0.5.1
pkgrel=4
pkgdesc="An Excel spreadsheet (.xls) and PowerPoint (.ppt) to HTML converter"
#arch=('i686')
arch=('any')
url="http://nebuchadnezzar.zion.cz/xlhtml.php"
license=('GPL')
source=("http://nebuchadnezzar.zion.cz/download/$pkgname-$pkgver-vd2.tgz")
sha256sums=('5e108b24adaa16f7c7c4828ba2fc16fc7e3bb7d7d4979ab8128e981124bcbc84')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --mandir="$pkgdir/usr/share/man" --build=i686-linux
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr" install
}
