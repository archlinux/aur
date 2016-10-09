pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.2.1
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

source=("https://dev.louiz.org/attachments/download/101/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('c860073cc16e01b22473d190b6ac59768caadfda59150b0d5f129a1fcb77a4d5b230fb5744884ce191813a4ab136a7ffbe154adc24034cf64abfd988c2ea5252')

package() {
    cd "$srcdir/$_pkgbase-$pkgver"
    python setup.py build
    python setup.py install --root="$pkgdir/" --optimize=1
}
