# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-opencensus
_pkgver=0.11.4-1.1.14
pkgver=0.11.4
pkgrel=1
pkgdesc='A stats collection and distributed tracing framework'
arch=('any')
url='https://github.com/census-instrumentation/opencensus-python'
license=('Apache-2.0')
depends=('python' 'python-google-api-core' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/census-instrumentation/opencensus-python/archive/v$_pkgver.tar.gz")
sha256sums=('8d1a99beb8959b3e330e50d6cda1929108b6bf4c33fe22f8e46a1275a18d881e')

_pkgname=opencensus-python

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/context/opencensus-context"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/context/opencensus-context"
  python setup.py install --root="$pkgdir"/ --optimize=1

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
