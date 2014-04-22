# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cpp-coveralls
pkgver=0.2.0
pkgrel=1
pkgdesc="Upload the coverage report of C/C++ project to coveralls.io."
arch=('i686' 'x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
depends=('python' 'python-requests' 'python-setuptools')
source=("$pkgname"::'git://github.com/eddyxu/cpp-coveralls.git'#tag=v${pkgver})
sha1sums=('SKIP')

build() {
    cd ${pkgname}
    python3 setup.py build
}

package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}
