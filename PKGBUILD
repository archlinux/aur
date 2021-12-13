# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=language-data
pkgname=python-weblate-language-data
pkgver=2021.6
pkgrel=1
pkgdesc="Language definitions used by Weblate"
url="https://github.com/WeblateOrg/language-data"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/language-data/archive/${pkgver}.tar.gz")

sha256sums=('89f0de33a7feb1ac58df36c7cda62f31b1d03398296677444380eb3d581524f3')

#check() {
#    pytest
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
