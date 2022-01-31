# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: AlexanderR <rvacheva at nxt dot ru>
# Contributor: Markus Heuser <markus.heuser@web.de>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=h264enc
pkgver=10.4.7
pkgrel=2
pkgdesc="Advanced shell script for encoding DVDs or video files to H.264 format using encoding utility MEncoder"
arch=('any')
url='http://h264enc.sourceforge.net/'
license=('GPL')
depends=('x264' 'lsdvd' 'lame' 'bc' 'mencoder')
optdepends=('mkvtoolnix' 'gpac' 'ogmtools' 'mplayer' 'pv' 'neroaacenc' 'vo-aacenc' 'aacplusenc' 'tsmuxer' 'vorbis-tools' 'dcaenc' 'opus-tools')
options=(!strip)
conflicts=(openh264)
install="${pkgname}.install"
source=("http://sf.net/projects/h264enc/files/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i -e "s|/usr/local|$pkgdir/usr|g" \
        -e 's|usr/local/|usr/|g' \
	-e 's|/man/man1|/share/man/man1|g' install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  ./install
  rm ${pkgdir}/usr/share/doc/h264enc/{uninstall,LICENSE}
}

sha1sums=('f10d8957306ed968c5b09662e6e5fad2f3feca37')
