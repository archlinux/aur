# Maintainer: Wouter de Vries <w.b.devries@utwente.nl>
pkgname=libwandio
_pkgname=wandio
pkgver=4.1.2
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('zlib' 'curl>=7.18.0')
provides=('libwandio')
source=("http://research.wand.net.nz/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cad6fc11eda87202fde357509b0e80993a126185b2365ba97a11f375c2e2908d')

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
