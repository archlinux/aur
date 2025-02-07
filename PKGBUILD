# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aio-pika
_pkgname=${_pkgbase/-/_}
pkgname=python-${_pkgbase}
pkgver=9.5.4
pkgrel=1
pkgdesc="AMQP 0.9 client designed for asyncio and humans"
arch=('any')
url="http://aio-pika.readthedocs.org/"
license=('Apache')
depends=('python' 'python-aiormq>=6.7.7' 'python-exceptiongroup' 'python-yarl')
makedepends=('python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('5a1bad96a75fa5ac3aa5b2bbd3eca971ea9abda70693e4334e6e629639f8a8fc')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
