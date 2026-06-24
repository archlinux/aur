# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions-bin
_pkgname=photoqt-extensions
pkgver=5.4
pkgrel=1
pkgdesc="Extensions for PhotoQt image viewer"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-extensions' 'photoqt-extensions-debug')
provides=('photoqt-extensions-bin-debug')
depends=('exiv2')
source=(https://photoqt.org/downloads/bin/$_pkgname-$pkgver.tar.gz)
sha256sums=('9acd89a80b007ec5d2622d79a4e70e93f086f567eb5b05a086602132b2ace1a6')

  # Extensions configured with:
  #
  # cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

package() {

  cd $srcdir/$_pkgname-$pkgver

  find extensions/ -type f -exec install -Dm 755 "{}" "$pkgdir/usr/lib/PhotoQt/{}" \;

}
