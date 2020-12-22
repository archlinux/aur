# Maintainer: bjoern kessler <bjoern.lindig@gmail.com>
pkgname=laborejo
pkgver=2.0.0
pkgrel=3
pkgdesc="A MIDI sequencer based on classical music notation."
arch=('x86_64')
url="https://laborejo.org/"
license=('GPL3')
depends=('glibc' 'python' 'python-pyqt5' 'ttf-dejavu' 'jack')
optdepends=('lilypond')
makedepends=('nuitka')
source=("https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('1a9e32f80e33871f10884e6bb4567d1a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
