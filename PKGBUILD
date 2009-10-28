# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.12
pkgrel=1
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python' 'pyqt' 'qt' 'mutagen' 'libofa' 'ffmpeg')
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/picard-$pkgver.tar.gz)
md5sums=('88284fb378462a091a092e03387f0da9')

build() {
  cd $srcdir/picard-$pkgver
  python setup.py config || return 1
  python setup.py install --root=$pkgdir || return 1
}
