# Maintainer: Wouter de Vries <w.b.devries@utwente.nl>
pkgname=libwandio
_pkgname=wandio
pkgver=4.2.4
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('zlib' 'curl>=7.18.0')
provides=('libwandio')
source=("https://github.com/LibtraceTeam/wandio/archive/refs/tags/$pkgver-1.tar.gz")
sha256sums=('6e1f36edfc3b814d62f91b09cee906e28cd811881da51544acf2ace5e6e5b13f')

build() {
	cd "$_pkgname-$pkgver-1"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver-1"
	make DESTDIR="$pkgdir/" install
}
