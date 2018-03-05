# Maintainer: Fabio Comuni <fabrix.xm@gmail.com> 

pkgname=gst-plugin-qrcode
pkgver=0.1.2
pkgrel=1
pkgdesc="QRCode decoder plugin for GStreamer"
arch=('i686' 'x86_64')
license=('LGPL3')
url="https://github.com/fabrixxm/gst-plugin-qrcode"
depends=('gstreamer' 'quirc')  
source=("https://github.com/fabrixxm/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('242fbdbe3df92565ae4629db21bb2e37')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

post_install() {
    # is needed?
    ldconfig
}
