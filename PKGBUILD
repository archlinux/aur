# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-download-youtube-videos-as-mp4
_pkgname=download_youtube_videos_as_mp4
pkgver=1.8.10
pkgrel=1
pkgdesc="Extension for firefox which download video"
arch=('any')
url="https://addons.mozilla.org/es/firefox/addon/download-youtube"
license=('GPL2')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/11869/addon-11869-latest.xpi")
md5sums=('dd8174f278ae17e48442670a4ece2c62')

package() {
  cd $srcdir
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions
  install -d $dstdir
  cp *.xpi $dstdir/${emid}.xpi
}
