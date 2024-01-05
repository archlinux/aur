# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aio-pika
_pkgname=${_pkgbase/-/_}
pkgname=python-${_pkgbase}
pkgver=9.3.1
pkgrel=1
pkgdesc="AMQP 0.9 client designed for asyncio and humans"
arch=('any')
url="http://aio-pika.readthedocs.org/"
license=('Apache')
depends=('python' 'python-aiormq>=6.7.7' 'python-yarl')
makedepends=('python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha256sums=('f199e5179ff9a362c1494ddd4d26f40834896726fea9b9d91de971b2ad304fc8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
