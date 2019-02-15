# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-aiokafka')
pkgver=0.5.0
pkgrel=2
pkgdesc='Asyncio client for Kafka'
arch=('any')
url='https://aiokafka.readthedocs.io'
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'kafka')
source=("https://github.com/aio-libs/aiokafka/archive/v${pkgver}.tar.gz")
sha256sums=('0f5817ee2b3824941a8d375d05da8ec74b8bb4fdc883ef63fc952cd900cbfd7a')

_dirname="aiokafka-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}

