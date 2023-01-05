# Maintainer: Franco Masotti <franco dot masotti at tutanota dot com>
# Contributor: Franco Masotti <franco dot masotti at tutanota dot com>
pkgname=python-fpyutils
pkgver=3.0.1
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://blog.franco.net.eu.org/software/#fpyutils"
license=('GPL3')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '8aa0fcefada2bebe76f5d9033f54efaf9652cc8deb0a8e6015f27fdb0c83f49e12fec1790462d07f6cc56cb20a270df199091633e1992fae02bea136254de35d')

check() {
    cd "${srcdir}"/fpyutils-"${pkgver}"
    python -m unittest discover --failfast --locals --verbose
}

build() {
    cd "${srcdir}"/fpyutils-"${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/fpyutils-"${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
