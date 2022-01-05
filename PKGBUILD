# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=python-cec-git
pkgver=0.2.7.r13.gf2d4bd3
pkgrel=1
pkgdesc="libcec bindings for Python"
arch=('any')
url="https://github.com/trainman419/python-cec"
license=('GPL')
depends=('libcec')
provides=('python-cec')
conflicts=('python-cec')
makedepends=('git' 'python-setuptools')
source=("python-cec-git::git+https://github.com/trainman419/python-cec.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    python setup.py build
}

package() {
    cd $srcdir/$pkgname
    python setup.py install --root="$pkgdir"
}
