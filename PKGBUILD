# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: AlexanderR <rvacheva at nxt dot ru>
# Contributor: Markus Heuser <markus.heuser@web.de>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=h264enc
pkgver=10.4.6
pkgrel=1
pkgdesc="Advanced shell script for encoding DVDs or video files to the H.264 format using the encoding utility MEncoder from MPlayer."
arch=('any')
url='http://h264enc.sourceforge.net/'
license=('GPL')
depends=('x264' 'lsdvd' 'lame' 'bc' 'mencoder')
optdepends=('mkvtoolnix' 'gpac' 'ogmtools' 'mplayer' 'pv' 'neroaacenc' 'vo-aacenc' 'aacplusenc' 'tsmuxer' 'vorbis-tools' 'dcaenc' 'opus-tools')
options=(!strip)
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

sha1sums=('aa8b20f3a51e8b133c7fc908227f6e024d4e2849')
