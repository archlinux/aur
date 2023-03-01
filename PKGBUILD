# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-pyfai
pkgver=2023.2
pkgrel=1
pkgdesc="Fast Azimuthal Integration in Python."
arch=('any')
url="http://www.silx.org"
license=('GPLv3' 'BSD' 'MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-fabio'
         'python-h5py-openmpi' 'python-pyopencl' 'python-pyqt5' 'fftw'
         'opencl-driver')
makedepends=('cython')
source=("https://github.com/silx-kit/pyFAI/archive/v${pkgver}.tar.gz")
sha256sums=('57e1403ff217e1402790ea06868016585c7e47b4f2eecbcdefeefca8f614f63a')

build() {
    cd "pyFAI-${pkgver}"
    python setup.py build
}

package() {
    cd "pyFAI-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
