# Maintainer: Joshua Leahy <jleahy@gmail.com>

pkgname=python2-requests-negotiate
pkgver=1.3.5
pkgrel=1
pkgdesc='Negotiate authentication for the requests HTTP client library'
arch=(any)
url='https://github.com/ox-it/requests-negotiate'
license=('BSD')
depends=('python2' 'python2-requests' 'python2-www-authenticate'
'python2-gssapi')
makedepends=('python2-setuptools')
source=('https://pypi.python.org/packages/fa/b8/d42bf2a1f759064fc68193fd810eb68e5a058d827c627d67caecfc992d24/requests-negotiate-1.3.5.tar.gz' 'LICENSE')
md5sums=('c367e991785519c22a90b36a6722bbb7' '51ec989993f192a55975cc94a1560c01')

build() {
    cd "${srcdir}/requests-negotiate-${pkgver}"
    python2 setup.py build
}

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/requests-negotiate-${pkgver}"
    python2 setup.py install -O1 --skip-build --root="${pkgdir}"
}

