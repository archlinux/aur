pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.2.4
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

source=("https://dev.louiz.org/attachments/download/117/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('e6d7fff434676cce441683f5bbd70431d84a8e8b72582c60555a2df6297b39b07249768e150bd23eefa16a2c30d449f0ebd0bd7c5d966b86c90f5da2f812bdf3')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
