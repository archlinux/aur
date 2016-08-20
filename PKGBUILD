# Maintainer: bitwave <bitwave [Att] oomlu [d0T] de>
pkgname=zpaqd
pkgver=7.15
_pkgver=715
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
md5sums=('0114cdd31e234cb84c51e520269c00b9')
sha256sums=('331f3b66dd000129346590a3c93cd86e19582405c195be7d3a9516b2aca7c820')

build() {
	c++ -O3 -s -static -Dunix zpaqd.cpp libzpaq.cpp -o zpaqd
}

check() {
	./zpaqd | grep zpaqd
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
