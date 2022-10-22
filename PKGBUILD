pkgbase='python-tictoc'
pkgname=('python-tictoc')
_module='pytictoc'
pkgver='1.5.2'
pkgrel=1
pkgdesc="Time code using syntax similar to tic and toc in MATLAB"
url="https://github.com/ericcfields/pytictoc"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dd9b636493bf140a1f8113eae296439dd5c8703ed9dcded181ae0936870530eb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
