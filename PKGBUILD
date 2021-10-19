# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=python-plover_stroke
pkgdesc="Helper class for working with steno strokes."
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python')
makedepends=('python-pytest')
url="https://github.com/benoit-pierre/plover_stroke"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/plover_stroke/archive/refs/tags/$pkgver.tar.gz")
sha1sums=(SKIP)

build() {
  cd "plover_stroke-$pkgver"
  python setup.py build_ext --inplace build
}

check() {
  cd "plover_stroke-$pkgver"
  python -m pytest
}

package() {
  cd "plover_stroke-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
