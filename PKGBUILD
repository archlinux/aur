# Maintener: Popolon <popolon@popolon.org>
 
pkgbase='python-bronzebeard'
pkgname=('python-bronzebeard')
_module='bronzebeard'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Minimal ecosystem for bare-metal assembly RISC-V development"
url="https://github.com/theandrew168/bronzebeard"
depends=('python' 'python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e956aa7b7e7ef8b4468c3c5f19c1ce5c0a67f7e98ecef5b8cd2dcef18028b269')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
