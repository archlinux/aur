# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-aiokafka')
pkgver=0.5.2
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=('any')
url='https://aiokafka.readthedocs.io'
license=('Apache')
depends=('python' 'kafka')
makedepends=('python-setuptools')
source=("https://github.com/aio-libs/aiokafka/archive/v${pkgver}.tar.gz")
sha256sums=('802d3e87e3113819eba46a2ded3d88c7f5d2fdbd18fc2f2afce96619b6d94404')

_dirname="aiokafka-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
