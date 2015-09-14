# Maintainer: Rafael Vega <contacto rafaelvega co>

pkgname=japa
pkgver=0.8.4
pkgrel=1
pkgdesc="JACK and ALSA Perceptual Analyser is a 'perceptual' or 'psychoacoustic' audio spectrum analyser."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('jack' 'clxclient' 'zita-alsa-pcmi' 'clthreads' 'fftw')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('966a8774e5b232bf055922dfdcc1b730')

build() {
  cd "$pkgname-$pkgver/source"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
