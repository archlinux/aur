pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.0
pkgrel=2
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('any')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns')
provides=('python-slixmpp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("http://dev.louiz.org/attachments/download/93/$_pkgbase-$pkgver.tar.xz")
sha512sums=('a2cb4fb20fc8cda4e14d6f7fe79335054f0ee6cd31bff09ccb0daf437c09ad83a0567645e3aeed0a6a8ec91fc91ad1eefc15830cd64b0aa22de4150ceada4057')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    # make sure UNICODE characters in the README are parsed correctly
    export LC_CTYPE=en_US.utf-8
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
