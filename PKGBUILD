# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=cmusfm
pkgver=0.3.3
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('9d9fa7df01c3dd7eecd72656e61494acc3b0111c07ddb18be0ad233110833b63')

build() {
	cd cmusfm-"$pkgver"
	autoreconf --install
	./configure --prefix=/usr --enable-libnotify
	make
}

package() {
	cd cmusfm-"$pkgver"
	make DESTDIR="$pkgdir" install
}
