# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-xml
_project=gawkextlib
pkgver=1.1.0
pkgrel=1
pkgdesc="GAWK extension - interface to Expat for parsing XML"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('expat' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('ab53e750d98c04bcedb2e847498a684b')
sha256sums=('79095ce5d6e7c1851dac1f6ecb10311c9901bb051b8eb33326b5b968a554357d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
