# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-glom
_name=glom
pkgver=24.11.0
pkgrel=2
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
  '4dddb8ccb3566e5cf8b2efa0276ab53cf651cc8998ac1453bac2440c52933f25'
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
