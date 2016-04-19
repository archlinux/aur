# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python2-purple-git"
pkgver="r226.b4ed49b"
pkgrel="1"
pkgdesc="Python bindings for libpurple."
arch=("i686" "x86_64")
url="https://github.com/fahhem/python-purple"
license=("GPL")
depends=("python2" "libpurple")
makedepends=("git" "cython2")
source=("git+https://github.com/fahhem/python-purple")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/python-purple"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/python-purple"
  python2 setup.py build
}

package() {
	cd "$srcdir/python-purple"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
