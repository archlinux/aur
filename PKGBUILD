# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-fpyutils
pkgver=4.0.1
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
sha512sums=('SKIP' 'dc7f0fa225502cf7cc2f6878fd3d160e15d6f9290e67bb1e24ce51d7a7e2c25d6c3ecc87b0a47ca3aa129639fcc1cfb945d8c1e76bec625b9047a9520d280236')

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
