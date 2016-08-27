# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkgname=irc3
pkgver=0.9.3
pkgrel=1
pkgdesc="plugable irc client library based on asyncio"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python' 'python-venusian')
makedepends=('python-setuptools')
optdepends=('python-docopt: for the irc3 command')
source=("https://pypi.io/packages/source/i/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('dbae1497af7c82f08f40ce2399c1833a')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
