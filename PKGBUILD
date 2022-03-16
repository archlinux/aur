# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-apycula'
pkgname=('python-apycula')
_module='Apycula'
pkgver='0.2'
pkgrel=1
pkgdesc="Open Source tools for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
depends=('python')
makedepends=('python-setuptools')
conflicts=('prjapicula')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c6faff3430230a3869226ccd94239c238c7974801e7c9d539d482806181d84f0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
