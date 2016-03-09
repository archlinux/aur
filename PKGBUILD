#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-tornado-redis')
pkgname=('python-tornado-redis')
_module='tornado-redis'
pkgver='2.4.18'
pkgrel=1
pkgdesc="Asynchronous Redis client for the Tornado Web Server."
url="http://github.com/leporo/tornado-redis"
depends=('python' 'python-tornado' 'python-redis')
makedepends=('python-setuptools')
license=('apache')
arch=('any')
source=("https://pypi.python.org/packages/source/t/tornado-redis/tornado-redis-${pkgver}.tar.gz"
        "http://www.apache.org/licenses/LICENSE-2.0")
sha256sums=('8fd3b324158291ad5fb7f5f8dc2e8763b2895556bd2a44f2dd721b703c669046'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "../LICENSE-2.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
