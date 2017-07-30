# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=md-to-rst
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool to convert markdown to restructed text (md to rst)"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/mdToRst"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/mdToRst/archive/${pkgver}.tar.gz")
sha512sums=("0d14e4c89e010f7ea11c5e5b75830146d244a0f24e124b3ea2782b9fc4cd3cc76f92b23c6c7c23fb36d469d6c2ca19f519e7263969808d94263915d042343b09")

build() {
  cd "$srcdir"/mdToRst-$pkgver
  python setup.py build
}

package() {
  cd mdToRst-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
