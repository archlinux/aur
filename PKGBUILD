# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
_name=pyreadstat
pkgver=1.1.3
pkgrel=1
pkgdesc="Python package to read sas, spss and stata files into pandas data frames."
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython')
license=('Apache' 'MIT')
arch=('i686' 'x86_64')
#source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name-$pkgver.tar.gz::https://github.com/Roche/pyreadstat/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('6bd684f0a26eead9b9446679e42aa037')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
