pkgbase='python-alpha_vantage'
pkgname=('python-alpha_vantage')
_module='alpha_vantage'
pkgver='2.1.0'
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage Api"
url="https://github.com/RomelTorres/alpha_vantage"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f4d5d59f8d5aa29cfe74ed1526fd2393b871b3aad8442bdeb23e2be0747446de')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
