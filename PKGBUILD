# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-pyfai
pkgver=0.19.0
pkgrel=1
pkgdesc="Fast Azimuthal Integration in Python."
arch=('any')
url="http://www.silx.org"
license=('GPLv3' 'BSD' 'MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-fabio'
         'python-h5py' 'python-pyopencl' 'python-pyqt5' 'fftw' 'opencl-driver')
makedepends=('cython')
source=("https://github.com/silx-kit/pyFAI/archive/v${pkgver}.tar.gz")
sha256sums=('1e329d2bdd6f4ddc4c70460bb0b994a33b6885bff810b11a7871d83ef8756281')

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
