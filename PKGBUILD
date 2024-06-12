# Maintener: Popolon <popolon@popolon.org>
 
pkgbase='python-bronzebeard'
pkgname=('python-bronzebeard')
_module='bronzebeard'
pkgver='0.2.2'
pkgrel=1
pkgdesc="Minimal ecosystem for bare-metal assembly RISC-V development"
url="https://github.com/theandrew168/bronzebeard"
depends=('python' 'python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('397eef9a2fdedee4e99d67764f5a1a1d1c7d5899ce9fa14927568ae04312a0e2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
