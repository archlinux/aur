# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=python-qroundprogressbar
_pkgname=QRoundProgressBar
pkgver=1.0.0
pkgrel=1
pkgdesc="circular progress bar PyQt5 widget (ported from C++ project at: https://sourceforge.net/projects/qroundprogressbar)"
arch=('any')
license=('Apache')
url="https://github.com/ozmartian/QRoundProgressBar"
source=(https://github.com/ozmartian/${_pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5')
makedepends=('python-setuptools')
provides=('python-qroundprogressbar')
md5sums=('481f13de166fe654e8d59758c38a29ce')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
