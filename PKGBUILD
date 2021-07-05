# Maintener: Popolon <popolon@popolon.org>

pkgbase='python-bronzebeard'
pkgname=('python-bronzebeard')
_module='bronzebeard'
pkgver='0.1.10'
pkgrel=3
pkgdesc="Minimal ecosystem for bare-metal assembly RISC-V development"
url="https://github.com/theandrew168/bronzebeard"
depends=('python' 'python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e6cdaf2841f3f223e7de5530ceaf2602694fe3d9bf6ecdf975803e30a589c059')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
