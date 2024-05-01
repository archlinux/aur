# Maintainer: Leonardo Muttoni <muttoni@gmail.com>

pkgname=xmms-pulse
pkgver=0.9.4
pkgrel=1
pkgdesc="XMMS output plugin for the PulseAudio sound server"
arch=('x86_64')
url="https://0pointer.de/lennart/projects/xmms-pulse/"
license=('GPL-2.0-or-later')
depends=('xmms')
provides=('libxmms-pulse.so')
source=(http://0pointer.de/lennart/projects/xmms-pulse/$pkgname-$pkgver.tar.gz)
md5sums=('c879939a6242f07b69298b30bcdeb6c5')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-bmp --disable-lynx --disable-static
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
