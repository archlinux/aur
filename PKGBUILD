# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

_name="py-motmetrics"
pkgname="python-motmetrics"
pkgver=1.4.0
pkgrel=7
pkgdesc='The py-motmetrics library provides a Python implementation of metrics for benchmarking multiple object trackers (MOT).'
arch=(any)
url="https://github.com/cheind/$_name"
license=(MIT)
depends=(python python-xmltodict python-scipy python-pandas python-numpy)
conflicts=()
makedepends=(python-setuptools)
source=($_name-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('376f9eacc95aac7297d07e2e22c8868b86878cfd650761ce39a428dd41e0e916')

build() {
  cd "${srcdir}/${_name}-master"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/${_name}-master"
  #python -m installer --destdir="$pkgdir" dist/*.whl  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
