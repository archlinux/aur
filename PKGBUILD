# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=cmusfm
pkgver=0.2.5
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('f6f0a2e60a3c00480903035f71339aa4ea8a70d2f64b3ff9a6ea2f75b61543af')

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
