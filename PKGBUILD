# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=charamel
pkgname=python-charamel
pkgver=1.0.0
pkgrel=1
pkgdesc="Truly Universal Encoding Detection in Python"
url="https://pypi.org/project/charamel/"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('ce0a81979b7602c5ede8449e836119b045a258222a16512c696852c37b1047e5')

#tests require git-lfs checkout which then also requires python-dephell for converting poetry pyproject.toml
#check() {
#    cd "${srcdir}"/${_pkgname}-${pkgver}
#    pytest tests
#}

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
