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
sha256sums=('ca53d1de1bb6dfafbf8d493d74014926e240d44bcb96c105514dbffa1f439530')

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
