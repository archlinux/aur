# Maintainer: Wouter de Vries <w.b.devries@utwente.nl>
pkgname=libwandio
_pkgname=wandio
pkgver=4.2.3
pkgrel=1
pkgdesc="software library written in C that provides an API for transparently reading from and writing to files using a variety of supported compression methods"
url="http://research.wand.net.nz/software/libwandio.php"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('zlib' 'curl>=7.18.0')
provides=('libwandio')
source=("http://research.wand.net.nz/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('78c781ce2c3783b85d894e29005b7e98fc246b33f94616047de3bb4d11d4d823')

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
