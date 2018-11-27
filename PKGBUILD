pkgname=python-sneakysnek-git
_module='sneakysnek'
pkgver=r11.8c760c5
pkgrel=1
pkgdesc="Dead simple cross-platform keyboard & mouse global input capture solution"
url="https://github.com/greyltc/sneakysnek"
depends=(python python-xlib)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("git://github.com/greyltc/sneakysnek.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

