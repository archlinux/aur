# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pydevicetree
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="This is a Python 3 library for parsing, querying, and modifying Devicetree Source v1 files as described in the Devicetree Specification v0.2."
arch=('any')
url="https://github.com/sifive/pydevicetree"
license=('Apache')
groups=()
depends=('python')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a788c4b9904251232015ad46aefa84a9152e8e27909b685d397428f64e2a4205')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
