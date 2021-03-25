pkgname=python-anyqt
pkgver=0.0.11
pkgrel=2
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
sha256sums=('4436dee6e0c9fa1b1d67971e03f30b6cf1896ee74ac461125e70cb9fe367823e')

build() {
    cd AnyQt-$pkgver
    python setup.py build
}

package() {
    cd AnyQt-$pkgver
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
