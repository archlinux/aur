# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.06
pkgrel=1
pkgdesc="A free UCI compliant open source chess engine developed by Peter Österlund"
arch=('i686' 'x86_64')
url="http://chessprogramming.wikispaces.com/Texel"
license=('GPL')
depends=('gcc-libs')
source=("http://dl.dropboxusercontent.com/u/89684995/texel106.7z")
md5sums=('05d491853e43c25d2fc69fcb1a14d8eb')
_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

build() {
	cd "${srcdir}/"
	make texel$_bits
}

package() {
	cd "${srcdir}/"
	install -Dm0755 $pkgname$_bits ${pkgdir}/usr/bin/$pkgname
}
