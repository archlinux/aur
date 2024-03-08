#Maintainer YangZhichao<1036711084@qq.com>

_pkgname=scripts
pkgname=python-scripts
pkgver=3.0.0
pkgrel=1
pkgdesc="A collection of various shell scripts"
arch=('any')
url='https://github.com/rsalmaso/scripts'
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-stua)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsalmaso/scripts/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f58b44c2ef252753647038449ea1766046ade8d26d8b0135e018891420a485c3')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
