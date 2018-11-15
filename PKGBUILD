# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=rextract
pkgver=1.1.0
pkgrel=1
pkgdesc="Powerful commandline tool to extract and manipulate strings using regular exressions"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/rextract"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/rextract/archive/${pkgver}.tar.gz")
sha512sums=("0f1934a3bf0e06ad365e2c7ece06f01f4229c24f553742a64b6ce63cfcdeffbc9a31b6d684d89a2e7aeb254cbdd7213fb35ec5b43e1cb1a320e50fd44b49982a")

build() {
  cd "$srcdir"/rextract-$pkgver
  python setup.py build
}

package() {
  cd rextract-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
