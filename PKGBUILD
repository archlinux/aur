# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.4.2
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://lab.louiz.org/poezio/${_pkgbase}/-/archive/slix-${pkgver}/${_pkgbase}-slix-${pkgver}.tar.gz")
sha512sums=('4220305e2f3d038071732da2e05641d54a0515b2f2ecdc2ed5aaf8c3ca287e9f521be369d9102c57c6891b605a16525d4805f5ab6699ff9f8b5844d4df457169')

build() {
    cd $_pkgbase-slix-$pkgver
    python setup.py build
}

package() {
    cd $_pkgbase-slix-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
