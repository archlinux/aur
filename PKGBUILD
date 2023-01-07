# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-kernel-driver'
pkgname=('python-kernel-driver')
_module='kernel_driver'
pkgver='0.0.7'
pkgrel=1
pkgdesc="A Jupyter kernel driver"
url="https://github.com/davidbrochart/kernel_driver.git"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1fe9add2cc14851246e1527c8d878514f7cf5511d05bf1176f7d36c4cb43a763')

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
