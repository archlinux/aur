# Maintener: Popolon <popolon@popolon.org>

pkgbase='python-bronzebeard'
pkgname=('python-bronzebeard')
_module='bronzebeard'
pkgver='0.1.15'
pkgrel=1
pkgdesc="Minimal ecosystem for bare-metal assembly RISC-V development"
url="https://github.com/theandrew168/bronzebeard"
depends=('python' 'python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('00fee5113cb33530741c72c2ed4b29c79e9954c42cf6de7f511eb468ae7441e3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
