# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=language-data
pkgname=python-weblate-language-data
pkgver=2023.3
pkgrel=1
pkgdesc="Language definitions used by Weblate"
url="https://github.com/WeblateOrg/language-data"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/language-data/archive/${pkgver}.tar.gz")

sha256sums=('1c54f14ed24d5768101f8e17487ffa2f50124dae57b80d771d2d3f1334c6067a')

#check() {
#    pytest
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
