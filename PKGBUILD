# Maintainer:   Razer <razer[AT]neuf[DOT]fr>
pkgname=rf24
pkgver='1.3.0'
pkgrel=1
pkgdesc='Linux support for RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
source=('git://github.com/TMRh20/RF24')
md5sums=('SKIP')

build() {
  cd "$srcdir/RF24"
  ./configure --driver=SPIDEV --prefix="$pkgdir/usr" --ldconfig=''
}

package() {
  cd "$srcdir/RF24"
  make -j1 install
  cd "$pkgdir/usr/lib"
  rm librf24.so librf24-bcm.so
  ln -s librf24.so.1 librf24.so
  ln -s librf24.so librf24-bcm.so
}

