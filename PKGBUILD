# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-apycula'
pkgname=('python-apycula')
_module='Apycula'
pkgver='0.2a4'
pkgrel=1
pkgdesc="Open Source tools for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9952d0fb645314e8a086a13a6eaf7f974e20528406a7f2138c6dc015dc907951')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
