pkgbase='python-cryptofetch'
pkgname=('python-cryptofetch')
_module='cryptofetch'
pkgver='1.2.0'
pkgrel=1
pkgdesc="CLI tool to fetch and view cryptocurrencies prices"
url="https://github.com/codeswhite/cryptofetch"
depends=('python' 'python-requests' 'python-prettytable' 'python-interutils')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('139d45b89bb0c2fa44938fc2b3d7d0ebd89f31db9cc6c8c681829ecb16ba934a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
