# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=language-data
pkgname=python-weblate-language-data
pkgver=2022.2
pkgrel=1
pkgdesc="Language definitions used by Weblate"
url="https://github.com/WeblateOrg/language-data"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/language-data/archive/${pkgver}.tar.gz")

sha256sums=('494068a0252b99c6e389eb728ce7ec677c79c946667ecea0ceb6ac3b33cb8329')

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
