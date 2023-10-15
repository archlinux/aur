# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=23.70
pkgrel=1
epoch=2
pkgdesc='Image editing and collection management program'
url=https://www.kornelix.net/fotoxx/fotoxx.html
arch=(x86_64)
license=(GPL3)
depends=(dcraw gtk3 libchamplain perl-image-exiftool xdg-utils)
optdepends=('darktable: organize and develop raw images'
	        'dvd+rw-tools: for burning CDs,DVDs or Blue-rays'
	        'ghostscript: handle .pdf, .ps or .eps files'
	        'hugin: for panorama photos'
            'rawtherapee: for raw image processing'
	        'vlc: for viewing video')
source=("https://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('9eea1a0a81d5860d4f8444f78880b93aa082594dfd2e99a137865cad6174daf4')

build() {
  make -C $pkgname PREFIX=/usr
}

package() {
  make -C $pkgname PREFIX=/usr ICONDIR=/usr/share/pixmaps DESTDIR="$pkgdir" install
}
