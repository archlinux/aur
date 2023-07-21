# Maintainer: Danct12 <danct12@disroot.org>

pkgname=python-gbinder
pkgver=1.1.1
pkgrel=4
pkgdesc="Python bindings for libgbinder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/erfanoabdi/gbinder-python"
license=('GPL')
depends=('libgbinder')
makedepends=('git' 'python-setuptools' 'cython0')
_commit="423dc366561c82515f4f2f46017535e7d81ce5b1"
source=(${pkgname}::git+https://github.com/erfanoabdi/gbinder-python.git#commit=${_commit})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${pkgname}
}

build() {
  cd ${pkgname}
  python3 setup.py build --cython
}

package() {
  cd ${pkgname}
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}
