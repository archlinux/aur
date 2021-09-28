# Maintainer: Jose Riha <jose1711 gmail com>
# Based on the output of pip2arch

pkgname=python2-imutils
_pkgname=imutils
pkgver=0.5.4
pkgrel=1
pkgdesc="A series of convenience functions to make basic image processing asier with OpenCV"
url="https://github.com/jrosebr1/imutils"
depends=('python2' 'opencv')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/3f/d3/ecb4d108f6c1041d24842a345ee0123cd7f366ba75cf122601e856d42ba2/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6769dc601bfea571d950b5f55ccb74f1')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1 
    # rename binary to prevent clash with python-imutils
    mv $pkgdir/usr/bin/range-detector $pkgdir/usr/bin/range-detector_p2
}
