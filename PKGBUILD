# Maintainer: Robert Scott <rs at robsco dot info>
pkgname=zita-at1
pkgver=0.6.0
pkgrel=1
pkgdesc="A 'autotuner' Jack application."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-at1-doc/quickguide.html"
license=('GPL2')
groups=('multimedia')
depends=('zita-resampler' 'clxclient' 'clthreads' 'jack' 'fftw')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/zita-at1-0.6.0.tar.bz2")
md5sums=('170335eb8961e9ea61dd08756ea7368d')

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
