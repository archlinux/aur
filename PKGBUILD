# Maintainer: Rafal Bolanowski <robin92pl@gmail.com>
pkgname=subconvert
pkgver=2.0.0
pkgrel=1
pkgdesc="Movie subtitles converter"
arch=('any')
url="https://github.com/mgoral/subconvert/"
license=('GPL3')
depends=('python>=3.2' 'python-pyqt5>=5.5' 'python-chardet>=2.3' 'mplayer' 'gettext>=0.19')
makedepends=('autoconf' 'intltool')
checkdepends=('python-nose')
source=("https://github.com/mgoral/subconvert/archive/2.0.0.tar.gz")
sha1sums=('bb0bd87c35a55d70e3a510830ebe9c6f3524b9ee')

build() {
	cd "$pkgname-$pkgver"
    ./autogen.sh
	./configure
	make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

