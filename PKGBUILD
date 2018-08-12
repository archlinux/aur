# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.4.0
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://dev.louiz.org/attachments/download/127/$_pkgbase-$pkgver.tar.gz")
sha512sums=('26d7459d2348c50db86bba4f3aae24d22003e0fe2b1e679c7725d480be9185b6f6d95dd94ed46d7b26b5a4b253fe6fc4d735dc56c02f9bc766cefa8f7ab8d198')

build() {
    cd $_pkgbase-$pkgver
    python setup.py build
}

package() {
    cd $_pkgbase-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
