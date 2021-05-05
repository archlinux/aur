# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
_name=pyreadstat
pkgver=1.1.2
pkgrel=1
pkgdesc="Python package to read sas, spss and stata files into pandas data frames."
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython')
license=('Apache')
arch=('i686' 'x86_64')
#source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name-$pkgver.tar.gz::https://github.com/Roche/pyreadstat/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('8ace4e59967d0b031e59ddafc17a6f5e')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
