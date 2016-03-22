# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=cmusfm
pkgver=0.3.1
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('359a46e60c59940d53b2c25093298d518f520be6aa2f4ee2363174ead6542e09')

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
