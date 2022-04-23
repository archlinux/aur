# Maintener: Popolon <popolon@popolon.org>

pkgbase='python-bronzebeard'
pkgname=('python-bronzebeard')
_module='bronzebeard'
pkgver='0.1.16'
pkgrel=1
pkgdesc="Minimal ecosystem for bare-metal assembly RISC-V development"
url="https://github.com/theandrew168/bronzebeard"
depends=('python' 'python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f9c6e66f4d1fa6fb535784fc3cf7f35910c1ebe0093c8b474230e0b019483098')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
