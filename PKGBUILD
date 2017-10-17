pkgname="python-pyaxmlparser-git"
pkgver=r62.c7aed22
pkgrel=1
pkgdesc='Parser for Android XML file and get Application Name without using Androguard '
arch=('any')
url='https://github.com/appknox/pyaxmlparser'
provides=("python-pyaxmlparser")
makedepends=('python-setuptools')
depends=('python')
license=('MIT')
source=('git://github.com/appknox/pyaxmlparser.git')
md5sums=('SKIP')

pkgver() {
  cd pyaxmlparser
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/pyaxmlparser"
    python setup.py build
}

package() {
    cd "$srcdir/pyaxmlparser"
    python setup.py install --root="$pkgdir/" --optimize=1
}
