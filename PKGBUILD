# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aio-pika
pkgname=python-${_pkgbase}
pkgver=6.8.0
pkgrel=1
pkgdesc="AMQP 0.9 client designed for asyncio and humans"
arch=('any')
url="http://aio-pika.readthedocs.org/"
license=('Apache')
depends=('python' 'python-aiormq>=3.2.3' 'python-aiormq<4.0.0' 'python-yarl')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('1d4305a5f78af3857310b4fe48348cdcf6c097e0e275ea88c2cd08570531a369')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
