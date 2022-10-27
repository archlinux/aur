# Former Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Alexandr Bogomyakov <ab@hexor.ru>

pkgname=cmusfm
pkgver=0.4.1
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('ff5338d4b473a3e295f3ae4273fb097c0f79c42e3d803eefdf372b51dba606f2')

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
