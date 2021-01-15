pkgbase='python-cryptofetch'
pkgname=('python-cryptofetch')
_module='cryptofetch'
pkgver=1.2.1
pkgrel=1
pkgdesc="CLI tool to fetch and view cryptocurrencies prices"
url="https://github.com/codeswhite/cryptofetch"
depends=('python' 'python-requests' 'python-prettytable' 'python-interutils')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("57f663b08b7a7f2b71c89fc26f36d16bac8f10d8793f4fa1d13e5c0c19e24a8a")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
