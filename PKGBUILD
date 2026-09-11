# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-glom
_name=glom
pkgver=25.12.0
pkgrel=1
pkgdesc="Python's nested data operator"
arch=('any')
url='https://github.com/mahmoud/glom'
license=('BSD-3')
makedepends=('python-setuptools')
depends=('python-boltons' 'python-attrs' 'python-face')
source=(
  "https://github.com/mahmoud/glom/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '2dd3a6355cbbae8ca48014cd85e549b2c80e9cfc9ccc125fca484f967ac2b79e'
)

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir" --optimize=1
}
