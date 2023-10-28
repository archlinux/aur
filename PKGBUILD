# Former Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Alexandr Bogomyakov <ab@hexor.ru>

pkgname=cmusfm
pkgver=0.5.0
pkgrel=1
pkgdesc="Last.fm scrobbler for cmus music player"
url="git+https://github.com/Arkq/cmusfm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('cmus' 'curl' 'libnotify' 'openssl-1.1')
install=cmusfm.install

source=(cmusfm-"$pkgver".tar.gz::https://github.com/Arkq/cmusfm/archive/v"$pkgver".tar.gz)

sha256sums=('17aae8fc805e79b367053ad170854edceee5f4c51a9880200d193db9862d8363')

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
