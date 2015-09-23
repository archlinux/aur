# $Id$
# Maintainer: Benjamin Chrétien <chretien+aur at lirmm dot fr>

pkgname=cpp-coveralls
pkgver=0.3.10
pkgrel=1
pkgdesc="Upload gcov results to coveralls.io"
arch=('i686' 'x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
depends=('python' 'python-requests' 'python-setuptools')
source=("https://github.com/eddyxu/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0257f3b879555e94c5197880ae843e1307cb9bda6dfcd0334f0d4787c9c0fa5f')

build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python3 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}
