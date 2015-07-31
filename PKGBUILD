pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.0
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('any')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns')
provides=('python-slixmpp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("http://dev.louiz.org/attachments/download/93/$_pkgbase-$pkgver.tar.xz")
md5sums=('099ab0d6a42fa9f4e95f5dd3e9d1df36')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    # make sure UNICODE characters in the README are parsed correctly
    export LC_CTYPE=en_US.utf-8
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
