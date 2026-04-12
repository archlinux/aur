# Contributor: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=telegnome
pkgver=0.3.7
pkgrel=2
pkgdesc='GNOME Teletext viewer'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://telegnome.sourceforge.io/'
license=('GPL')
depends=('gtk3')
makedepends=('itstool')
source=(http://deb.debian.org/debian/pool/main/t/telegnome/telegnome_0.3.7.orig.tar.xz channels.patch)
sha512sums=('177ab5012bc943369c55af75b46d6e9355717585191bcb001b78c603763023976410e7fc088ce372fcbef84f0d29eb7b925fa1a55d22745194ca352466c89b6a'
            '78171262026f133232263abe3e139210976028aceb5d3578a19271eec70f4af0d17e1da809d8ac9f6d01584a0c2cc1bf2916762249f2872a94e2ccaad71faa9d')

prepare() {
	cd $pkgname-$pkgver
  patch -p2 -i $srcdir/channels.patch
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --disable-rpath
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
