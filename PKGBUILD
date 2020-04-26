# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=0.10.1
pkgrel=1
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml')
optdepends=('python-pyqt4: for the fabio_viewer program')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('0c89c5afdead668beae8e79948a6eae7c1d4767c33acde96d68bfe3a2d7dcd96')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
