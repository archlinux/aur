# Contributor: VuDu <vudu[dot]curse[at]gmail[dot]com>

pkgname=gkrellm-bluez
pkgver=0.2
pkgrel=2
pkgdesc="GKrellM BlueZ is a plugin that displays a graph of RX/TX bytes of Bluetooth adaptors. It uses the same layout as a Net monitor."
arch=('i686' 'x86_64')
url="http://gkrellm-bluez.sourceforge.net/"
license=('GPL')
depends=('gkrellm' 'bluez-libs')
source=("http://downloads.sourceforge.net/sourceforge/gkrellm-bluez/gkrellm-bluez-${pkgver}.tar.gz")
md5sums=('e5dbdb540450bfa21d8d1fa02086d770')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
