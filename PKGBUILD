# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-node-semver')
pkgver=0.2.0
pkgrel=1
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/python-semver"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=(https://github.com/podhmo/python-semver/archive/$pkgver.tar.gz)
sha512sums=('cb218b25599905c30917d1209616f16adb0afaeb2d3820cfae9dfd52e9930285f45495c11c8f7e8cb6c413ce5c49023558f07438fa3de330b01dfdc8ea55a039')

build() {
  cd "$srcdir/python-semver-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python-semver-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  # install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
  # install -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
