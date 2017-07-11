# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo-bin
_name=polo-file-manager
pkgver=17.7.1
_channel=beta.9
pkgrel=1
pkgdesc="A modern, light-weight GTK file manager for Linux, currently in beta (.deb binary version)"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'vte3' 'rsync')
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
source_i686=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-${pkgver}-${_channel}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-${pkgver}-${_channel}-amd64.deb")
md5sums_i686=('0e2e3c93ecffb92124520ea3cc6384d8')
md5sums_x86_64=('8dc062afc6730fca3ae6e1a383d7d465')

package() {

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
}
