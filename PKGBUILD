# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkgname=irc3
pkgver=1.1.3
pkgrel=1
pkgdesc="plugable irc client library based on asyncio"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python' 'python-venusian')
makedepends=('python-setuptools')
optdepends=('python-docopt: for the irc3 command')
source=("https://pypi.io/packages/source/i/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('154913b379f4e5e803cf2e14e1b5272138b495a10003a6c1c6bb969c415a3283')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
