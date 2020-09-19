# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-linetools
_pyname=${pkgname#python-}
pkgver=0.3.dev2147
pkgrel=2
pkgdesc="Package for the analysis of 1-D spectra for astronomy."
arch=('x86_64')
url="https://linetools.readthedocs.io/"
license=('BSD')
depends=('python'
         'python-numpy'
         'python-astropy'
         'python-scipy'
         'python-matplotlib'
         'python-pyqt5'
         'python-h5py')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86f631e7e52b2dc80e5e96b2d22621f3')

package(){
    cd $srcdir/${_pyname}-$pkgver

    install -D -m644 licenses/LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 licenses/README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
