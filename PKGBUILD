# Maintainer: Andrea Fagiani <andfagiani  gmail  com>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>
pkgname=xvidenc
pkgver=8.6.0
pkgrel=1
pkgdesc="Advanced shell script for encoding DVDs or video files to the XviD format using the encoding utility MEncoder from MPlayer."
arch=(any)
url="http://xvidenc.sourceforge.net/"
license=('GPL2')
depends=('mencoder' 'mplayer' 'xvidcore>=1.1.0' 'lsdvd' 'lame' 'bc' 'bash')
optdepends=('mkvmerge: for Matroska support'
            'gpac: for mp4 support'
            'ogmtools: for DVD chapter export to file')
source=(http://downloads.sourceforge.net/sourceforge/xvidenc/$pkgname-$pkgver.tar.gz)
md5sums=('876f50e365795152fc60912fafb1ed6b')

build() {
  /bin/true
}

package() {
  cd $srcdir/$pkgname-$pkgver
  sed -i -e "s|/usr/local/|$pkgdir/usr/|g" \
    -e 's|/usr/man/|/usr/share/man/|g' \
    -e '41,76d' install
  ./install
}
