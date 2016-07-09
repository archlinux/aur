# Maintainer: bitwave <bitwave [Att] oomlu [d0T] de>
pkgname=zpaqd
pkgver=7.08
_pkgver=708
pkgrel=1
pkgdesc="a public domain development tool allows you to create, test, debug, and optimize new compression algorithms in streaming format that are compatible with all existing ZPAQ decompressors such as zpaq, zpipe, zpsfx, and the reference decoder"
arch=('i686' 'x86_64')
url="http://mattmahoney.net/dc/zpaqutil.html"
license=('GPL')
depends=()
makedepends=('grep')
provides=('zpaqd')
conflicts=('zpaqd')
replaces=('zpaqd')

source=("http://mattmahoney.net/dc/$pkgname$_pkgver.zip")
md5sums=('7444d5ea181ce203519739faaba80422')
sha256sums=('4a5cb6a609a4a3d88636ea102737f0660f55faa80704110e2d378fb3cf77b3a2')

build() {
	c++ -O3 -s -static -Dunix zpaqd.cpp libzpaq.cpp -o zpaqd
}

check() {
	./zpaqd | grep zpaqd
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
