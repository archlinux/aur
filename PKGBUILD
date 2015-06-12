# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=fdmf
pkgver=0.0.9s
pkgrel=4
pkgdesc="utility for finding pairs of music files in a collection based on audio fingerprint"
arch=('i686' 'x86_64')
url="http://w140.com/audio/"
license=('GPL')
depends=('perl' 'mplayer' 'mpg123' 'vorbis-tools' 'plotutils' 'fftw')
source=("http://w140.com/audio/${pkgname}-${pkgver}.tar.gz")
md5sums=('853a7c18612b64baf52383a3d7894587')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	make
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm 755 ./fdmf $pkgdir/usr/bin/fdmf
	install -Dm 755 ./fdmf_bench $pkgdir/usr/bin/fdmf_bench
	install -Dm 755 ./vector_pairs $pkgdir/usr/bin/vector_pairs
	install -Dm 755 ./sonic_reducer $pkgdir/usr/bin/sonic_reducer
	install -Dm 755 ./cleanup_dups $pkgdir/usr/bin/cleanup_dups
	install -Dm 755 ./optparam $pkgdir/usr/bin/optparam
	install -Dm 644 ./README $pkgdir/usr/share/doc/fdmf/README
}
