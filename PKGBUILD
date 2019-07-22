# Maintainer: Wouter de Vries <w.b.devries@utwente.nl>
pkgname=libwandio
_pkgname=wandio
pkgver=4.2.2
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('zlib' 'curl>=7.18.0')
provides=('libwandio')
source=("http://research.wand.net.nz/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1196f3a4fc36cc886e71dcd13f542d3648dad989dbe53bc81ec35da19cc8fbbc')

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
