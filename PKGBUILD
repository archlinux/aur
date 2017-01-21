pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.2.3
pkgrel=2
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('any')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules')
provides=('python-slixmpp')
conflicts=('python-slixmpp-git')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://dev.louiz.org/attachments/download/114/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('369c458024c64fabd423d20098f60b2b4685c0500b43f8acf0ff423ca9dc75d9bcea81b0418f8d28eb9207a73a2773ea140fe026fa9667be28c93730e5567cb7')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
