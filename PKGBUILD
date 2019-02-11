# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp-git
pkgver=r2240.e53c0fcb
pkgrel=1
pkgdesc="An XMPP library written for Python 3.5+ (SleekXMPP asyncio fork)"
arch=(any)
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.5' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
provides=('python-slixmpp')
conflicts=('python-slixmpp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("git://git.poez.io/slixmpp")
md5sums=('SKIP')

pkgver() {
    cd slixmpp
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd slixmpp
    python setup.py build
}

package() {
    cd slixmpp
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
