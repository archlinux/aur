pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.2.2
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

source=("https://dev.louiz.org/attachments/download/111/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('262f3462ce81b63fa3e7ef7255ee86c4ada184d047da4baf7b10c0d552713741e4e67ac56751f4b5d7bf838acefa43d5fba3dfc5d89f0443511a03b9e9ce89e2')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
