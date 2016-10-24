# Maintainer: Renze Nicolai <renze@rnplus.nl>
# Builds from GIT repository by user "schollii"

pkgname=pypubsub-git
gitname=pypubsub
pkgver=20161021.0a0e49c
pkgver() {
  cd "$gitname"
  git log -1 --format=%cd.%h --date=short|tr -d -
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    cd "$srcdir/$gitname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$gitname"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-bui$
}
