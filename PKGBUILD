pkgname=python-slixmpp-git
_pkgbase=slixmpp
pkgver=r1795.225e07e
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=(any)
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns')
provides=('python-slixmpp')
makedepends=('git')
options=(!emptydirs)

source="git://git.poez.io/slixmpp"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgbase"
    # make sure UNICODE characters in the README are parsed correctly
    export LC_CTYPE=en_US.utf-8
    python setup.py install --root="$pkgdir/" --optimize=1
}
