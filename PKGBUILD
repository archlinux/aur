# Maintainer: Max G <max3227@gmail.com>

_module='interutils'
pkgname="python-$_module"
pkgver=0.12.7
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url="https://pypi.org/project/$_module/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-termcolor')
optdepends=('python-pyfiglet: Figlet banner printing')

source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("3a0575bb62ba2c4c4b4af14938a075b99de744a524ca42913d280a729636320e")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd $srcdir/${_module}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
