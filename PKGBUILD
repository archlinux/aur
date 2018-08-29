# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-node-semver')
pkgver=0.3.0
pkgrel=3
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/python-semver"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=(https://github.com/podhmo/python-semver/archive/$pkgver.tar.gz)
sha512sums=('0b11793bae171cab391484e9db326b2e5676e7387d38b7a384a03e65a087e5f5abf21fd8c9b09ae0a58c4021a24302eef8123eaf9f14ae4d72a58a2c701cd99b')

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
