# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=sampleicc
_pkgbase=SampleICC
pkgver=1.6.8
pkgrel=1
pkgdesc="ICC's sample color management library"
arch=("i686" "x86_64")
url="http://sampleicc.sourceforge.net/"
license=("ICC")
depends=("libtiff")
source=("http://downloads.sourceforge.net/sourceforge/sampleicc/sampleicc%20tar/SampleIcc-$pkgver/$_pkgbase-$pkgver.tar.gz")
sha256sums=("8b23bc6b9e4b8d304dc239bf874078edf7764e999aee4e11e7ed2d1c0271b965")

build() {
	cd "$_pkgbase-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
}
