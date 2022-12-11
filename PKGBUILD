# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pkgname=aiokafka
pkgname=python-$_pkgname
pkgver=0.8.0
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=('x86_64')
url='https://aiokafka.readthedocs.io'
license=('Apache')
depends=('python-kafka')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/aio-libs/aiokafka/archive/v$pkgver.tar.gz")
sha256sums=('494be1172bd69032b8b49d6445c2a47f575c677df1ac8578f41f44cad1144f1a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
