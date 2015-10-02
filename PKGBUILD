pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.1
pkgrel=1
pkgdesc="An XMPP library written for Python 3.4 (SleekXMPP asyncio fork)"
arch=('any')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python>=3.4' 'python-aiodns' 'libidn')
provides=('python-slixmpp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/s/slixmpp/$_pkgbase-$pkgver.tar.gz")
sha512sums=('43c32ddfd8645dc86f6e1a0218b86a8581b8110e149afe43f58d4704571ed02f7c0168bff803ab1e61e3ff6160e824c70c11578cecde5ba7ff4e71cc6371f24c')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
