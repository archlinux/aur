# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-apycula'
pkgname=('python-apycula')
_module='Apycula'
pkgver='0.2a2'
pkgrel=1
pkgdesc="Open Source tools for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a5c568606061a7d8f2b96049fd1a62f1c8f00e03e3849d4facf6e58f90d04e99')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
