# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=python-qroundprogressbar
_pkgname=QRoundProgressBar
pkgver=1.0.0
pkgrel=3
pkgdesc="Circular progress bar PyQt5 widget (ported from C++ project at: https://sourceforge.net/projects/qroundprogressbar)"
arch=('any')
license=('Apache')
url="https://github.com/ozmartian/QRoundProgressBar"
#source=(https://github.com/ozmartian/${_pkgname}/archive/${pkgver}.tar.gz)
source=(git+https://github.com/ozmartian/${_pkgname}.git)
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
provides=('python-qroundprogressbar')
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
