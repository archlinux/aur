# Maintainer: Tomislav Ivek <tomislav dot ivek at gmail dot com>

pkgname=python-patch-ng
pkgver=1.17.1
pkgrel=2
pkgdesc='Library to parse and apply unified diffs forked from python-patch.'
arch=('any')
url="https://github.com/conan-io/python-patch/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'fakeroot')
source=("https://github.com/conan-io/python-patch-ng/archive/${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/conan-io/python-patch-ng/${pkgver}/LICENSE")
md5sums=('7e5612deaa2cec54e9a924b09cbd2c6a'
         '505d9f4b8b27052bef960af06bfdfe01')

build() {
  cd "$srcdir/python-patch-ng-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python-patch-ng-$pkgver"
  python setup.py install --optimize=1 --root "$pkgdir"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
