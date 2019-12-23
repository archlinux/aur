# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: tatsumoto
# Based on the output of pip2arch

pkgname=python-imutils
_pkgname=imutils
pkgver=0.5.2
pkgrel=2
pkgdesc="A series of convenience functions to make basic image processing asier with OpenCV"
url="https://github.com/jrosebr1/imutils"
depends=('python' 'opencv' 'hdf5' 'python-numpy')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/5e/0c/659c2bdae8e8ca5ef810b9da02db28feaa29ea448ff36b65a1664ff28142/imutils-${pkgver}.tar.gz")
md5sums=('bfb5a2cd095cebd3e4a27e8653d1322c')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
