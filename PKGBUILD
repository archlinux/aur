# Maintainer: bjoern kessler <bjoern.lindig@gmail.com>
pkgname=laborejo
pkgver=2.0.1
pkgrel=2
pkgdesc="A MIDI sequencer based on classical music notation."
arch=('x86_64')
url="https://laborejo.org/"
license=('GPL3')
depends=('glibc' 'python' 'python-pyqt5' 'ttf-dejavu' 'jack')
optdepends=('lilypond')
source=("https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('9647b60548b17193126f9a0b84aac50f')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
