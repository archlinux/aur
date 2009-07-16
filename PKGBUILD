# $Id: PKGBUILD,v 1.8 2009/02/06 09:36:20 partition Exp $
# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.11
pkgrel=2
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python' 'pyqt' 'qt' 'mutagen' 'libofa' 'nas' 'ffmpeg')
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/picard-$pkgver.tar.gz)
md5sums=('02ddcff3e201b2cf54f1b52b02d44fad')

build() {
  cd $startdir/src/picard-$pkgver
  python setup.py config || return 1
  python setup.py install --root=$startdir/pkg || return 1
}
