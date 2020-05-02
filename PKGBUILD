# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.5.1
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://lab.louiz.org/poezio/${_pkgbase}/-/archive/slix-${pkgver}/${_pkgbase}-slix-${pkgver}.tar.gz")
sha512sums=('4f66a974a1efaea996570b252957b1528f506c488ade7d73bc3c4d38f66769f7b7730da86d07a0253f69ca52506ed9e7bc1e43d1923f4328d69cbe7957a58e3c')

build() {
    cd $_pkgbase-slix-$pkgver
    python setup.py build
}

package() {
    cd $_pkgbase-slix-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
