# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-ftx-git"
pkgver=1.1.r30.gd123787
pkgrel=1
pkgdesc="Unofficial Python wrapper for FTX API"
arch=('any')
url="https://github.com/quan-digital/ftx"
license=('MIT')
depends=('python-requests' 'python-ciso8601')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"/ftx
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${srcdir}"/ftx
    python setup.py build
}

package() {
    cd "${srcdir}"/ftx
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
