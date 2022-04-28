# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=telegnome
pkgver=0.3.6
pkgrel=1
pkgdesc='GNOME Teletext viewer'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://telegnome.sourceforge.io/'
license=('GPL')
depends=('gtk3')
makedepends=('itstool')
source=(https://download.gnome.org/sources/$pkgname/0.3/$pkgname-$pkgver.tar.xz)
sha512sums=('686992367ee55daba446791090372750729dabb15ab4d2e5e8eb9db523f35e024032a4619b73c38bc374070f57cb18a9deaafc4b6a3ae23226ffa1d80f3b209a')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --disable-rpath
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
