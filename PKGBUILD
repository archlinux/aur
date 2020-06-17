# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=siphashc
pkgname=python-siphashc
pkgver=1.3
pkgrel=1
pkgdesc="python c-module for siphash"
url="https://github.com/WeblateOrg/translation-finder"
depends=('python')
makedepends=('python-setuptools')
license=('ISC')
arch=('any')
source=("https://github.com/WeblateOrg/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('d27feb98d42a8a10fe91d05936d56df52f592a6c0817276dab3562bfbdd249ae')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py test
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
