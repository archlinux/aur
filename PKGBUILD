# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aiormq
pkgname=python-${_pkgbase}
pkgver=6.8.1
pkgrel=1
pkgdesc="Pure python AMQP 0.9.1 asynchronous client library"
arch=('any')
url="http://github.com/mosquito/aiormq"
license=('Apache')
depends=('python' 'python-pamqp' 'python-yarl')
makedepends=('python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('a964ab09634be1da1f9298ce225b310859763d5cf83ef3a7eae1a6dc6bd1da1a')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
