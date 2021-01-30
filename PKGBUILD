pkgname=python-pay-by-square
_module='pay-by-square'
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate QR codes for by square payments"
url="https://github.com/matusf/pay-by-square"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d8c8e326f9d5cbb932b38aea60e1f7d5e8e85234e7b02fe47240a0acf26857db')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
