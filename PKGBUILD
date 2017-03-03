# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-glmnet')
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python port of the glmnet package."
url="https://github.com/civisanalytics/python-glmnet"
makedepends=(
    'gcc-fortran'
    'python'
    'python-numpy')
license=('GPL2' 'BSD')
arch=('i686' 'x86_64')
source=("https://github.com/civisanalytics/python-glmnet/archive/v$pkgver.tar.gz")
sha256sums=('49a4f9e8cba978ea8f482ef70ca5dff6a3617ef8a9ceae139533251370ac9ded')

build() {
    export LDFLAGS="$LDFLAGS -shared"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
