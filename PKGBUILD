# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Huguenin Loïs <huguenindl at gmail dot com>

pkgname=oqapy
pkgver=3.0.0
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
)
source=(http://www.oqapy.eu/releases/$pkgname-$pkgver.tar.gz)
sha256sums=('c0f5704ff520ea7457d9722a70a3f6127bed48c0bfbf3adf99840f7967950440')
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
  cd "$pkgdir/usr/bin"
  ln -s /usr/share/oqapy/oqapy
}
