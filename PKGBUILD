# Maintainer	: GI_Jack <GI_Jack@hackermail.com>
# Contributor	: Skydrome <irc.freenode.net>
# Contributor	: Chris Brannon <cmbrannon79@gmail.com>
# Contributor	: giniu <gginiu@gmail.com>

pkgname=python2-foolscap
pkgver=0.13.2
pkgrel=1
pkgdesc="RPC protocol for Python and Twisted"
url="http://foolscap.lothar.com"
license=('MIT')
arch=('any')
conflicts=('python2-foolscap-i2p')
options=(!emptydirs)

depends=('python2-twisted'
         'python2'
         'python2-pyopenssl')

_patchver="${pkgver}-r0"
source=("http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz"
        "http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz.asc")

validpgpkeys=('734145FEBE70E5D059C7EDCD3E8692AFAF1B4A2A')

sha256sums=('8498c7e9eaecb5b19be74b18d55c2086440be08de29f2bb507f9b505757467ff'
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

