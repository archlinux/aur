# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions-bin
_pkgname=photoqt-extensions
pkgver=5.1
pkgrel=1
pkgdesc="Extensions for PhotoQt image viewer"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-extensions' 'photoqt-extensions-debug')
provides=('photoqt-extensions-bin-debug')
depends=('exiv2' 'imagemagick')
source=(https://photoqt.org/downloads/bin/$_pkgname-$pkgver.tar.gz)
sha256sums=('1868692f4cb7089c23c527f20b3f85559343b54204cce877ffb6a99bce292da0')
install="photoqt-extensions.install"

  # Extensions configured with:
  #
  # cmake .. -DWITH_IMAGEMAGICK=ON -DWITH_GRAPHICSMAGICK=OFF -DCMAKE_BUILD_TYPE=Release
  #          -DCMAKE_INSTALL_PREFIX=/usr

package() {

  cd $srcdir/$_pkgname-$pkgver

  find extensions/ -type f -exec install -Dm 755 "{}" "$pkgdir/usr/lib/PhotoQt/{}" \;

}
