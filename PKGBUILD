# Maintainer: Danct12 <danct12@disroot.org>

pkgname=python-gbinder
pkgver=1.1.0
pkgrel=1
pkgdesc="Python bindings for libgbinder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/erfanoabdi/gbinder-python"
license=('GPL')
depends=('libgbinder')
makedepends=('git' 'python-setuptools' 'cython')
_commit="bcf3debcc171108d02be49e22bfbab5c15d216e2"
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
