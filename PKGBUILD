# Maintainer: Robert Scott <rs at robsco dot info>
pkgname=zita-at1
pkgver=0.4.0
pkgrel=1
pkgdesc="A 'autotuner' Jack application."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-at1-doc/quickguide.html"
license=('GPL2')
groups=('multimedia')
depends=('zita-resampler' 'clxclient' 'clthreads' 'jack2' 'fftw')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/zita-at1-0.4.0.tar.bz2")
md5sums=('4e068b6cd9ceea981f7c9000a568fbe7')

build() {
	cd "$pkgname-$pkgver"
	cd source
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd source
	make DESTDIR="$pkgdir/" install
}
