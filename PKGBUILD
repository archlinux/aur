# Maintainer: Heorhi Valakhanovich <valahanovich@tut.by>

pkgname=('dlangide')
pkgver=0.7.6
pkgrel=1
pkgdesc="D language IDE based on DlangUI "
arch=('i686' 'x86_64')
url="https://github.com/buggins/dlangide"
license=("BSL")
groups=('dlang')
makedepends=('dmd')

source=(
	"https://github.com/buggins/dlangide/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'57929661899f8707602d160e0592cce2476b7483e5d1c8dc778d5bc25aa2b416'
)

build() {
	cd $srcdir/dlangide-$pkgver
	dub build
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -m755 \
		$srcdir/dlangide-$pkgver/bin/dlangide \
		$pkgdir/usr/bin/dlangide
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 $srcdir/dlangide-$pkgver/LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
