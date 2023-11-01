# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=23.74
pkgrel=1
epoch=2
pkgdesc='Image editing and collection management program'
url=https://www.kornelix.net/fotoxx/fotoxx.html
arch=(x86_64)
license=(GPL3)
depends=(dcraw gtk3 libchamplain perl-image-exiftool xdg-utils xorg-xmessage)
optdepends=('darktable: organize and develop raw images'
            'dvd+rw-tools: for burning CDs, DVDs and Blue-rays'
            'ffmpeg: for video files'
            'ghostscript: for .pdf, .ps and .eps files'
            'hugin: for panorama photos'
            'libheif: for .heic, .avif and .webp files'
            'liborigin: for .jp2 files'
            'rawtherapee: for raw image processing'
            'vlc: for viewing video')
source=("https://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('f0dc0879d448f743d7df38ef8d7ef865abe5feb730809267d83fb278f8e92476')

build() {
  make -C $pkgname PREFIX=/usr
}

package() {
  make -C $pkgname PREFIX=/usr ICONDIR=/usr/share/pixmaps DESTDIR="$pkgdir" install
}
