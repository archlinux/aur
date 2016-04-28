# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=bitlbee-steam
pkgver=1.4.1
pkgrel=1
pkgdesc='Steam protocol plugin for BitlBee'
arch=('i686' 'x86_64')
url='https://github.com/bitlbee/bitlbee-steam'
license=('GPL')
depends=('bitlbee' 'libgcrypt')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
