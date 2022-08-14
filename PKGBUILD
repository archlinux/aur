# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-pyfai
pkgver=0.21.3
pkgrel=2
pkgdesc="Fast Azimuthal Integration in Python."
arch=('any')
url="http://www.silx.org"
license=('GPLv3' 'BSD' 'MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-fabio'
         'python-h5py-openmpi' 'python-pyopencl' 'python-pyqt5' 'fftw'
         'opencl-driver')
makedepends=('cython')
source=("https://github.com/silx-kit/pyFAI/archive/v${pkgver}.tar.gz")
sha256sums=('3524dee3c5eaa9415c125b08f5a4e1ed9c08ea51d657a5c4a7a74fd0eedf7764')

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
