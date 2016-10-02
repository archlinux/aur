pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.2
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('any')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules')
provides=('python-slixmpp')
conflicts=('python-slixmpp-git')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://pypi.python.org/packages/c2/9f/1ac5304ab1801b08c20b07ee658583abdce9b7ae47ea3faf0d062e86221b/slixmpp-1.2.tar.gz")
sha512sums=('d710a020b1e81a1ff59ea60897e89a451ad8ad4af5540265cfc2fd21135c81933f1ff8f23543bbf22da8380147c1417088080060755687c2903e26310138d1ef')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
