# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pkgname=aiokafka
pkgname=python-$_pkgname
pkgver=0.7.2
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=('x86_64')
url='https://aiokafka.readthedocs.io'
license=('Apache')
depends=('python-kafka')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest' 'python-gssapi')
source=("https://github.com/aio-libs/aiokafka/archive/v$pkgver.tar.gz")
sha256sums=('a6b9d8cb8d9e837ea38473545a2ac798e6648b5d81b22627963cbc6bd8c1dd81')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
