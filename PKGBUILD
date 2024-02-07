# Maintainer: willemw <willemw12@gmail.com>

pkgname=fotocx
pkgver=24.11
pkgrel=1
pkgdesc='Image editing and collection management program'
url=https://www.kornelix.net/fotocx/fotocx.html
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
replaces=(fotoxx)
source=("https://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('bc3e12a7ae2deb80ff41b14d392f15010eed93eb383dd184d605967c47a78b95')

build() {
  make -C $pkgname PREFIX=/usr
}

package() {
  make -C $pkgname PREFIX=/usr ICONDIR=/usr/share/pixmaps DESTDIR="$pkgdir" install
}
