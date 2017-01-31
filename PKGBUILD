# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=cmusfm
pkgver=0.3.2
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('52b6fa21265dd05f58bc472dde2e8742acc47c9973ca3bd7b47e2f7c5e733e60')

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
