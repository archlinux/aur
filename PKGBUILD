# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: eightballbill  <guglielmo.deconcini [at] gmail (dot) com>

_project=pubsub
_pkgname=PyPubSub
pkgname=python2-$_project
pkgver=3.3.0
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=("any")
license=("BSD")
url="https://pypi.python.org/pypi/PyPubSub"
depends=("python2")
makedepends=("python2-setuptools")
source=("https://downloads.sf.net/project/$_project/$_project/$pkgver/$_pkgname-$pkgver.zip")
md5sums=('1c8d88cc2506532df85bc95dde719816')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
