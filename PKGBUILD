# Maintainer: lmartinez-mirror
pkgname=python-randomfiletree
_name=RandomFileTree
pkgver=1.2.0
pkgrel=1
pkgdesc="Creates a random file and directory tree/structure for testing"
arch=('any')
url="https://github.com/klieret/randomfiletree"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('randomfiletree')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE::https://github.com/klieret/RandomFileTree/blob/master/LICENSE.txt")
sha256sums=('3a92e12ecbf093dc6b3fc1405c69030ed32db3a8a4a71f28724bd347f4c49afc'
            '4c69748fa3fad8b70a1668be2513ff515a332077a88e38a47aaf15ce54138692')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
