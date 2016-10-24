# Maintainer: Renze Nicolai <renze@rnplus.nl>
# Builds from GIT repository by user "schollii"

pkgname=pypubsub-git
gitname=pypubsub
pkgver=git
pkgver() {
  cd "$gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=('any')
url="https://pypi.python.org/pypi/PyPubSub"
license=('BSD')
depends=("python2")
makedepends=("python2-setuptools")
source=("git+https://github.com/schollii/pypubsub.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
