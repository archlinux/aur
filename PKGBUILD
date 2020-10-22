# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-opencensus
pkgver=0.7.11
pkgrel=1
pkgdesc='A stats collection and distributed tracing framework'
arch=('any')
url='https://github.com/census-instrumentation/opencensus-python'
license=('Apache-2.0')
depends=('python' 'python-google-api-core')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/census-instrumentation/opencensus-python/archive/v$pkgver.tar.gz")
sha256sums=('af3a4f7f8782ec38bda43aabb747d29714af4ac5d75219b9f5970ec6d17cef00')

_pkgname=opencensus-python

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/context/opencensus-context"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/context/opencensus-context"
  python setup.py install --root="$pkgdir"/ --optimize=1

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
