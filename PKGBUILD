# Maintainer	: GI_Jack <GI_Jack@hackermail.com>
# Contributor	: Skydrome <irc.freenode.net>
# Contributor	: Chris Brannon <cmbrannon79@gmail.com>
# Contributor	: giniu <gginiu@gmail.com>

pkgname=python2-foolscap
pkgver=0.6.4
pkgrel=1
pkgdesc="RPC protocol for Python and Twisted"
url="http://foolscap.lothar.com"
license=('MIT')
arch=('any')
conflicts=('python2-foolscap')
provides=('python2-foolscap')
options=(!emptydirs)

depends=('python2-twisted'
         'python2'
         'python2-pyopenssl')

_patchver="${pkgver}-r0"
source=("http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz"
        "http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz.asc")

validpgpkeys=('734145FEBE70E5D059C7EDCD3E8692AFAF1B4A2A')

sha256sums=('74b283dd68a3c9d68ebf4e9b4ebf5cfb37480915b6a808ac930fe858a66f8d99'
            'SKIP')

build() {
    cd "${srcdir}/foolscap-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/foolscap-${pkgver}"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

