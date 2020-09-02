# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=siphashc
pkgname=python-siphashc
pkgver=2.1
pkgrel=1
pkgdesc="python c-module for siphash"
url="https://github.com/WeblateOrg/siphashc"
depends=('python')
makedepends=('python-setuptools')
license=('ISC')
arch=('any')
source=("https://github.com/WeblateOrg/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('e6a9da952d684a52cb797dff7a96639bad2bdb779e4856158aa294618d505fbe')

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
