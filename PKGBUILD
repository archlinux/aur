pkgname=('python-arch')
_module='arch'
pkgver='4.0'
pkgrel=1
pkgdesc="ARCH models in Python."
url="https://pypi.python.org/pypi/arch/4.0"
depends=('python'
    'python-numpy'
    'python-pandas'
    'python-scipy'
    'python-statsmodels')
makedepends=(
    'cython'
    'python-setuptools')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://github.com/bashtage/arch/archive/${pkgver}.tar.gz")
md5sums=('9a98f2cd94fb2f8272fb5a2cad439ffc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
