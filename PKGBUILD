# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=2022.12.1
pkgrel=1
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml')
optdepends=('python-pyqt4: for the fabio_viewer program')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('08f9f3b1d10dc7bd7614df419e3014896587fe58c58efd97a7fa9c4bb267d865')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
