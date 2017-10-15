# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Huguenin Loïs <huguenindl at gmail dot com>

pkgname=oqapy
pkgver=3.0.3
pkgrel=1
pkgdesc="An application intended to sort files of the image type in graphic mode."
arch=(any)
url="http://www.oqapy.eu/"
license=('GPL')
depends=(
python-oqapy-iproc
liboqapy-iproc
python-pillow
python-pyqt5
python-exiv2
python-numpy
gphoto2
dcraw
opencv
hdf5
)
source=(http://www.oqapy.eu/releases/$pkgname-$pkgver.tar.gz oqapy.sh)
sha256sums=('39ed959552bbb5323241d6dbffbd4177ebdeb13eacc574f2e573e42431d8a0eb'
            'e5bd611647c50b21fb2b1f61801ee45172ee0aa052c3cf15e5e15cf8a0646a27')
package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/oqapy
  install -dm755 "$pkgdir"/usr/share/pixmaps
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/man/man1


  cp -R ./ $pkgdir/usr/share/oqapy
  mv $pkgdir/usr/share/oqapy/oqapy.1 $pkgdir/usr/share/man/man1
  mv $pkgdir/usr/share/oqapy/oqapy.desktop  $pkgdir/usr/share/applications/
  install -Dm644 $pkgdir/usr/share/oqapy/medias/oqapy_ic_48.png \
    "$pkgdir"/usr/share/pixmaps/
  # workaround for:
  # Cannot decode file /usr/bin/tgz ...
#   install -Dm755 "$srcdir"/oqapy.sh "$pkgdir"/usr/bin/oqapy
   cd "$pkgdir/usr/bin"
   ln -s /usr/share/oqapy/oqapy
}
