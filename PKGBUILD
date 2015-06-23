# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=gmap-gsnap
_version=2014-12-17
pkgver=2014.12.17
pkgrel=1
epoch=
pkgdesc="A Genomic Mapping and Alignment Program for mRNA and EST Sequences, and Genomic Short-read Nucleotide Alignment Program"
arch=("i686" "x86_64")
url="http://research-pub.gene.com/gmap/"
license=('custom')
depends=('perl')
options=()
source=("http://research-pub.gene.com/gmap/src/$pkgname-$_version.tar.gz")
md5sums=('3c4fd021abc1a5c23e01bb8fef9b2cd1')

build() {
	cd "$srcdir/gmap-$_version"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/gmap-$_version"
	make -k check
}

package() {
	cd "$srcdir/gmap-$_version"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
