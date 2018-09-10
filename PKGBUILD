# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-kafka' 'python2-kafka')
pkgver=1.4.3
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=('x86_64')
url="https://github.com/mikeboers/PyAV/tree/master"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/dpkp/kafka-python/archive/${pkgver}.tar.gz")
sha256sums=('8b07844c62650d4843631492aa7348498958931dd89de294da598c7590484b52')

_dirname="kafka-python-${pkgver}"

build_python-kafka() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

build_python2-kafka() {
  cd "${srcdir}/${_dirname}"
  python2 setup.py build
}

package_python-kafka() {
  depends=('python' 'kafka')
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-kafka() {
  depends=('python2' 'kafka')
  cd "${srcdir}/${_dirname}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
