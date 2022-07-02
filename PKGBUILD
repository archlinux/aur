# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=language-data
pkgname=python-weblate-language-data
pkgver=2022.3
pkgrel=1
pkgdesc="Language definitions used by Weblate"
url="https://github.com/WeblateOrg/language-data"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/language-data/archive/${pkgver}.tar.gz")

sha256sums=('5f29061eaa69f043b211cdf551d5c7d03a514178d80aee8a5beaf92a0d75beaa')

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
