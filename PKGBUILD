# Maintainer: Wouter de Vries <w.b.devries@utwente.nl>
pkgname=libwandio
_pkgname=wandio
pkgver=1.0.3
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('zlib' 'curl=>7.18.0')
provides=('libwandio')
source=("http://research.wand.net.nz/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('249645e4cc4fa9e89f1183d23f022918')

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
