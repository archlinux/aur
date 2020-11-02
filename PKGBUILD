# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aio-pika
pkgname=python-${_pkgbase}
pkgver=6.7.1
pkgrel=1
pkgdesc="AMQP 0.9 client designed for asyncio and humans"
arch=('any')
url="http://aio-pika.readthedocs.org/"
license=('Apache')
depends=('python' 'python-aiormq>=3.2.0' 'python-yarl')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('9773440a89840941ac3099a7720bf9d51e8764a484066b82ede4d395660ff430')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
