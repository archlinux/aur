# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_project=pubsub
_pkgname=PyPubSub
pkgname=python-$_project
pkgver=3.3.0
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=("any")
license=("BSD")
url="https://pypi.python.org/pypi/PyPubSub"
depends=("python")
makedepends=("python-setuptools")
source=("https://downloads.sf.net/project/$_project/$_project/$pkgver/$_pkgname-$pkgver.zip")
sha256sums=("05e301917a8489f4fdf71bf5a717526a44c4f908e93809df366accec2886a84b")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
