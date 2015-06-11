# Maintainer: delta48 <dark.magician.48[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-download-youtube-videos-as-mp4
_pkgname=download_youtube_videos_as_mp4
pkgver=1.8.3
pkgrel=1
pkgdesc="Extension for firefox which download video"
arch=('any')
url="https://addons.mozilla.org/es/firefox/addon/download-youtube"
license=('GPL2')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/296174/${_pkgname}-${pkgver}-sm+fx.xpi")
md5sums=('ae14a7b9aac83d390062480358652156')

package() {
  cd $srcdir
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -R * $dstdir
  rm $dstdir/$_pkgname-$pkgver-sm+fx.xpi
}
