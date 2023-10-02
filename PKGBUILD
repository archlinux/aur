# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

_name="py-motmetrics"
pkgname="python-motmetrics"
pkgver=1.4.0
pkgrel=4
pkgdesc='The py-motmetrics library provides a Python implementation of metrics for benchmarking multiple object trackers (MOT).'
arch=(any)
url="https://github.com/cheind/$_name"
license=(MIT)
depends=(python python-xmltodict python-scipy python-pandas python-numpy)
conflicts=()
makedepends=(python-setuptools)
source=($_name-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec637ba10f02105c8a6d7a702ff85a06dd4487343a61274f0ced52ec43d25320')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/${_name}-${pkgver}"
  #python -m installer --destdir="$pkgdir" dist/*.whl  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
