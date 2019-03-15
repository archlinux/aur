# Maintainer: Charles Wise <charles [at] charlesbwise [dot] com>

_python=python2
_pkgname=python-musicbrainz2
pkgname=$_python-musicbrainz2
pkgver=0.7.4
pkgrel=4
pkgdesc='A client library written in python which provides easy object oriented access to the MusicBrainz database'
arch=('any')
url='https://musicbrainz.org/doc/python-musicbrainz2'
license=('BSD')
depends=('python2')
optdepends=('libdiscid: For calculating disc IDs')
replaces=('python-musicbrainz2<=0.7.4-1')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('40ac802d832deca737cce57235cb23a5')

build() {
  cd $_pkgname-$pkgver

  $_python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  $_python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS.txt README.txt CHANGES.txt
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING.txt
}
