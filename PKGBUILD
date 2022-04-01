# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-apycula'
pkgname=('python-apycula')
_module='Apycula'
pkgver='0.3'
pkgrel=1
pkgdesc="Open Source tools for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
depends=('python')
makedepends=('python-setuptools')
conflicts=('prjapicula')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('35c79cae7e5f416d22020ac4dcfec6653c7c1354e216a88332165048fac3bdd9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
