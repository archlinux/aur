# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.12.1
pkgrel=2
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python' 'pyqt' 'qt' 'mutagen' 'libofa' 'ffmpeg')
install=picard.install
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/picard-$pkgver.tar.gz)
md5sums=('cfe594d68924afbc0704888130295c85')

build() {
  cd $srcdir/picard-$pkgver
  python setup.py config || return 1
  python setup.py install --root=$pkgdir || return 1
}
