# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=audioprism
pkgver=1.1.0
pkgrel=1
pkgdesc="A spectrogram tool for PulseAudio and WAV files"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/vsergeev/audioprism"
license=('GPL3')
depends=('libpulse' 'fftw' 'sdl2' 'sdl2_ttf' 'libsndfile' 'graphicsmagick')
source=("git+https://github.com/vsergeev/audioprism.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
