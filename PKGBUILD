# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-fpyutils
pkgver=4.0.0
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
sha512sums=('SKIP' 'ffcad84e0e83ad06b7382ba5241ea17f67816469ddee39b56cb58eacf3f6941b9ae9717cd9978f24245f620a66ef973cae04f28665f2238dd02ac8a9a112924e')

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
