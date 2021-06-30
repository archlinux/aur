# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: eightballbill  <guglielmo.deconcini [at] gmail (dot) com>

_project=pubsub
_pkgname=pypubsub
pkgname=python2-$_project
pkgver=3.4.2
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=("any")
license=("BSD")
url="https://pypi.python.org/pypi/PyPubSub"
depends=("python2")
makedepends=("python2-setuptools")
source=("https://github.com/schollii/${_pkgname}/archive/refs/tags/rel_${pkgver}.tar.gz")
md5sums=('f589f3c5c5a056e70fa2310342c511c2')

build() {
    cd "$srcdir/$_pkgname-rel_$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-rel_$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
