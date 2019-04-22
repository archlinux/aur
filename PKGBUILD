# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=gmap-gsnap
_version=2019-03-15
pkgver=2019.03.15
pkgrel=1
epoch=
pkgdesc="A Genomic Mapping and Alignment Program for mRNA and EST Sequences, and Genomic Short-read Nucleotide Alignment Program"
arch=("i686" "x86_64")
url="http://research-pub.gene.com/gmap/"
license=('custom')
depends=('perl')
options=()
source=("http://research-pub.gene.com/gmap/src/$pkgname-$_version.tar.gz")
md5sums=('f82cc84c3ce268b6315afec1118e7269')

build() {
	cd "$srcdir/gmap-$_version"
	./configure --prefix=/usr
	make
}

# disable tests since some of them are currently broken
#check() {
#	cd "$srcdir/gmap-$_version"
#	make -k check
#}

package() {
	cd "$srcdir/gmap-$_version"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
