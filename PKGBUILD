# Maintainer: willemw <willemw12@gmail.com>

pkgname=fotocx
pkgver=26.8.1
pkgrel=1
pkgdesc='Image editing and collection management program'
url=https://www.kornelix.net/fotocx/fotocx.html
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(dcraw gtk3 libjxl perl-image-exiftool webkit2gtk-4.1 xdg-utils xorg-xmessage)
optdepends=(
  'darktable: organize and develop raw images'
  'dvd+rw-tools: for burning CDs, DVDs and Blue-rays'
  'ffmpeg: for video files'
  'ghostscript: for .pdf, .ps and .eps files'
  'hugin: for panorama photos'
  'libheif: for .heic, .avif and .webp files'
  'liborigin: for .jp2 files'
  'libwebp-utils: for .webp files'
  'rawtherapee: for raw image processing'
  'vlc: for viewing video')
replaces=(fotoxx)
source=("https://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('ee7c75f10cfddbe9eed7e2f394c396a8255a81f2a385ad5879bb2ff58dc10281')

build() {
  make -C $pkgname PREFIX=/usr
}

package() {
  make -C $pkgname PREFIX=/usr ICONDIR=/usr/share/pixmaps DESTDIR="$pkgdir" install
}
