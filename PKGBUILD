# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jmeters
pkgver=0.4.4
pkgrel=1
pkgdesc="Various analog-style audio level meters for JACK"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
license=('GPL2')
depends=('cairo' 'clthreads' 'clxclient' 'jack')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('49ace779e6b0a937039543b130ae8441')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
