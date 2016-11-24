# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-download-youtube-videos-as-mp4
_pkgname=download_youtube_videos_as_mp4
pkgver=1.8.8
pkgrel=1
pkgdesc="Extension for firefox which download video"
arch=('any')
url="https://addons.mozilla.org/es/firefox/addon/download-youtube"
license=('GPL2')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/11869/addon-11869-latest.xpi")
md5sums=('e10305133cd66ae40b0e8d558a2e089e')

package() {
  cd $srcdir
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions
  install -d $dstdir
  cp *.xpi $dstdir/${emid}.xpi
}
