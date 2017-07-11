# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=17.7.1
_channel=beta.9
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync')
makedepends=('vala')
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get prograss info for compression and extraction'
            'pdftk: converting PDF files'
            'ffmpeg: generate thumbnails for video'
            'p7zip: read and extract multiple archive formats'
            'ghostscript: converting PDF files'
            'pngcrush: reduce file size of PNG files'
            'polo-donation-plugins')
provides=('polo')
conflicts=('polo' 'polo-bin')
options=(emptydirs)
source=(https://github.com/teejee2008/polo/archive/v${pkgver}-${_channel}.tar.gz)
md5sums=('a05de5620a640eb3f6d50fa5d7b97bae')

package() {
  cd $srcdir/${pkgname}-${pkgver}-${_channel}
  make
  make DESTDIR=$pkgdir install

  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
}
