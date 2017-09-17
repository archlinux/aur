# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=qt-dab-git
pkgver=VERSION
pkgrel=1
pkgdesc="software dab decoder for use with a dabstick, airspy or sdrplay for RPI and PC"
arch=('i686' 'x86_64')
url="http://www.sdr-j.tk"
license=('GPL2')
depends=('qt5-base' 'libsndfile' 'fftw' 'portaudio' 'faad2' 'zlib' 'rtl-sdr' 'qwt-qt5' 'libsamplerate')
makedepends=('git')
provides=('qt-dab-git')
conflicts=('qt-dab' 'sdr-j-dabreciever')
source=('git+https://github.com/JvanKatwijk/qt-dab.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/qt-dab"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/qt-dab"
	qmake qt-dab.pro
	make
}

package() {
	cd "$srcdir/qt-dab"
}
