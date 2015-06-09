# Maintainer: bitwave <bitwave [Att] oomlu [d0T] de>
pkgname=zpaqd
pkgver=6.33
_pkgver=633
pkgrel=2
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
sha256sums=('bd913f3f843fb9a14a2b015d35d37ac87b56bdb9b9fee71469a3e9ca2a61ef03')
md5sums=('a274a6347f6b2e8d85a9866859207946')

build() {
	c++ -O3 -s -static -Dunix zpaqd.cpp libzpaq.cpp -o zpaqd
}

check() {
	./zpaqd | grep zpaqd
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
