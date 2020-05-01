# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=pyinsane
pkgname=python-pyinsane
pkgver=2.0.13
pkgrel=2
pkgdesc="Python library to access and use image scanners"
arch=(any)
url="https://gitlab.gnome.org/World/OpenPaperwork/pyinsane"
license=(GPL3)
depends=(python-pillow sane)
makedepends=(git python-setuptools)
_commit=3e509e6bdd2c07ac715cfc27946f86123744a46e  # tags/2.0.13^0
source=("git+https://gitlab.gnome.org/World/OpenPaperwork/pyinsane.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}
