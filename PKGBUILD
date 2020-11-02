# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-git-python
pkgver=1.1.2
pkgrel=1
pkgdesc='combination and simplification of some useful git commands'
arch=('any')
url='https://github.com/pynickle/git-python'
license=('None')
depends=(python python-gitpython)
makedepends=(python python-setuptools)
_pkgname=git-python
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pynickle/git-python/archive/v$pkgver.tar.gz")
sha256sums=('7f5fc81b49967fcb003b164d97aa8259641c5929aa52328e7e5e30f4da5e2e77')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir"/ --optimize=1
}
