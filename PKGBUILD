# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-piexif
_pyname=piexif
pkgname=('python-piexif' 'python2-piexif')
makedepends=('python' 'python2')
pkgver=1.0.3
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://pypi.python.org/pypi/piexif#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.zip")
sha512sums=('e011936bc9a339d60cdc21cf740b725745a434b782a380caf6896f101b1d41cc04f24135cb745406f042e070601773b0f4adbeb66f5aa757a514b86ddaf576b6')

package_python-piexif() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-piexif() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
