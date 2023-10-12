# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-lap"
pkgver=1.0.0
pkgrel=1
pkgdesc='lap is a linear assignment problem solver using Jonker-Volgenant algorithm for dense (LAPJV) or sparse (LAPMOD) matrices.'
arch=(any)
url="https://github.com/gatagat/lap"
license=(BSD-2-Clause)
depends=(python python-scipy python-pytest python-numpy)
conflicts=()
makedepends=(python-setuptools)
source=(lap-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('0d8e79cba5fa51349850f667318e7f5c5ce1737015834016f02a2ec3eab84173')

build() {
  cd "${srcdir}/lap-master"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/lap-master"
  #python -m installer --destdir="$pkgdir" dist/*.whl  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
