# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=language-data
pkgname=python-weblate-language-data
pkgver=2020.10
pkgrel=1
pkgdesc="Language definitions used by Weblate"
url="https://github.com/WeblateOrg/language-data"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/language-data/archive/${pkgver}.tar.gz")

sha256sums=('486dfef779764ea63c88b82f72f9ebfc85725dda7320c73568a9c1ff07326ea3')

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
