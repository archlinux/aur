# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cpp-coveralls
pkgver=0.1.2
# This project does not have tags or releases, so we rely on the commit hash
_commit=e117aa76e5f55bef7630d200cdfdd19550d4a9a8
pkgrel=1
pkgdesc="Upload the coverage report of C/C++ project to coveralls.io."
arch=('i686' 'x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
depends=('python' 'python-requests' 'python-setuptools')
source=("$pkgname"::'git://github.com/eddyxu/cpp-coveralls.git'#commit=${_commit})
sha1sums=('SKIP')

build() {
    cd ${pkgname}
    python3 setup.py build
}

package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}
