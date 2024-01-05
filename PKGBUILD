# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aiormq
pkgname=python-${_pkgbase}
pkgver=6.7.7
pkgrel=1
pkgdesc="Pure python AMQP 0.9.1 asynchronous client library"
arch=('any')
url="http://github.com/mosquito/aiormq"
license=('Apache')
depends=('python' 'python-pamqp' 'python-yarl')
makedepends=('python-build' 'python-installer')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('3b93f612f56989b2757a9a7b299dd94dd3227ce28ba43e81d5fbcded6341dfab')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
