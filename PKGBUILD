# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=siphashc
pkgname=python-siphashc
pkgver=2.1
pkgrel=1
pkgdesc="Python module (in c) for siphash-2-4"
url="https://github.com/WeblateOrg/siphashc"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-wheel')
license=('ISC')
arch=('x86_64')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6a9da952d684a52cb797dff7a96639bad2bdb779e4856158aa294618d505fbe')

check() {
    cd ${_pkgname}-${pkgver}
    python setup.py test
}

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
