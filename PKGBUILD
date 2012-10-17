# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=6.0.0_97
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash perl)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] \
	&& depends=(${depends[@]} lib32-glibc lib32-expat lib32-zlib) \
	|| depends=(${depends[@]} expat zlib)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/pool/non-free/${pkgname}_${pkgver//_/-}_i386.deb)

package() {
	cd "$pkgdir"
	tar xf "$srcdir/data.tar.gz"
}

sha256sums=('8fa8508a4505d8ed8475f06708249416cec0bf3707dc2003d1899cb342f4a9ba')

