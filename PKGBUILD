# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>

_name=xmpppy
pkgname=python-$_name
pkgver=0.7.1
pkgrel=1
pkgdesc="Python 2/3 implementation of XMPP (RFC3920, RFC3921)."
arch=('any')
url="https://github.com/xmpppy/xmpppy"
license=('GPL3')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('483b287fa02898394272ae643536ff9eb16375b665d4e32d82912c0f1aacf30b90ef8cabedaabd9e15608b456e8b0354e365a346e7e674f68f28b58b21a82288')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
