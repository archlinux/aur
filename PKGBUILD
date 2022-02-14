# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-tre-git
pkgver=r130.9c049c8
pkgrel=3
pkgdesc="Python module for TRE"
url="https://github.com/ahomansikka/tre/tree/master"
arch=('any')
provides=('python-tre')
depends=('python' 'tre')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/ahomansikka/tre.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tre"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/tre/python3"
  python setup.py build
}

package() {
  cd "$srcdir/tre/python3"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
