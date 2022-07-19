# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_project=pubsub
_pkgname=pypubsub
pkgname=python-$_project
pkgver=4.0.3
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=("any")
license=("BSD")
url="https://pypi.python.org/pypi/PyPubSub"
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/schollii/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('42d8eff087a055b76534e72e0f1f170b')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
