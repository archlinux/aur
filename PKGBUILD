# Maintainer: Jon Nordby <jononor@gmailc.com>
pkgname=gstpeaq
pkgver=0.6.1
pkgrel=2
epoch=
pkgdesc="GStreamer plugin for Perceptual Evaluation of Audio Quality (PEAQ)"
arch=('x86_64')
url="https://github.com/HSU-ANT/gstpeaq"
license=('LGPL')
depends=('gstreamer' 'gst-plugins-good')
makedepends=()
install=
source=("https://github.com/HSU-ANT/gstpeaq/releases/download/version-$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('55541f9ce3aa4f55d689e15454aee751')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
