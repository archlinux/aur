# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-kernel-driver'
pkgname=('python-kernel-driver')
_module='kernel_driver'
pkgver='0.0.5'
pkgrel=1
pkgdesc="A Jupyter kernel driver"
url="https://github.com/davidbrochart/kernel_driver.git"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/9a/90/bae13566f2d90743ad8d5a2256ed521f02e67fc01f49b3b124ac690672a7/${_module}-${pkgver}.tar.gz")
sha256sums=('f7c58743b1df06066beaed038804a30bebb05587fc014a94fa382e7bfba748ca')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-kernel-driver/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
