# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-pygam')
_module='pyGAM'
pkgver='0.8.0'
pkgrel=1
pkgdesc="Generalized Additive Models in Python"
url="https://pygam.readthedocs.io"
checkdepends=('python-pytest')
depends=('python' 'python-numpy' 'python-progressbar' 'python-scipy')
makedepends=('python-setuptools')
optdepends=('python-scikit-sparse')
license=('GPL-3')
arch=('any')
source=("https://github.com/dswah/pyGAM/archive/v$pkgver.tar.gz")
sha256sums=('2d20c983d4553dd7bf638c0c6470190ec165765f91662c18c7340adeeae270be')

check() {
    cd "$srcdir/$_module-$pkgver"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 clean
}
