# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=0.4.0
pkgrel=1
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml')
optdepends=('python-pyqt4: for the fabio_viewer program')
makedepends=('git')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha1sums=('c0ca0a6935e9213b567fdcfa77da05900a1abbc3')

build() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
