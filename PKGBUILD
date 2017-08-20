# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.06
pkgrel=1
pkgdesc="A free UCI compliant open source chess engine developed by Peter Österlund"
arch=('i686' 'x86_64')
url="http://chessprogramming.wikispaces.com/Texel"
license=('GPL')
depends=('gcc-libs')
source=("https://github.com/B4dT0bi/texel/archive/${pkgver}.zip")
md5sums=('3ae1db48a1b70b0fe8cff0772ac5a2dc')
_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

build() {
	cd "${srcdir}/texel-${pkgver}/"
	make texel$_bits
}

package() {
	cd "${srcdir}/texel-${pkgver}/"
	install -Dm0755 $pkgname$_bits ${pkgdir}/usr/bin/$pkgname
}
