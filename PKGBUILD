pkgbase='python-pytrends'
pkgname=('python-pytrends')
_module='pytrends'
pkgver='4.6.0'
pkgrel=1
pkgdesc="Pseudo API for Google Trends"
url="https://github.com/dreyco676/pytrends"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('763401369ed062dfae4991997b453f4f3e9869ecc7cbc8d63dec6ef9aab0f60d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
