# Maintainer: willemw <willemw12@gmail.com>

pkgname=fotocx
pkgver=25.4
pkgrel=1
pkgdesc='Image editing and collection management program'
url=https://www.kornelix.net/fotocx/fotocx.html
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(dcraw gtk3 libchamplain perl-image-exiftool xdg-utils xorg-xmessage)
optdepends=(
  'darktable: organize and develop raw images'
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
sha256sums=('f7389a43668ea4d210cb11455e34289b293b88a5e3e593002a1edffbacdedb1c')

build() {
  make -C $pkgname PREFIX=/usr
}

package() {
  make -C $pkgname PREFIX=/usr ICONDIR=/usr/share/pixmaps DESTDIR="$pkgdir" install
}
