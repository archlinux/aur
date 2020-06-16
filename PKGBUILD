# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-kafka' 'python2-kafka')
pkgver=2.0.0
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=('x86_64')
url="https://github.com/dpkp/kafka-python"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/dpkp/kafka-python/archive/${pkgver}.tar.gz")
sha256sums=('454bf3aafef9348017192417b7f0828a347ec2eaf3efba59336f3a3b68f10094')

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
