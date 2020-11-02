# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aiormq
pkgname=python-${_pkgbase}
pkgver=3.3.1
pkgrel=1
pkgdesc="Pure python AMQP 0.9.1 asynchronous client library"
arch=('any')
url="http://github.com/mosquito/aiormq"
license=('Apache')
depends=('python' 'python-pamqp' 'python-yarl')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('8218dd9f7198d6e7935855468326bbacf0089f926c70baa8dd92944cb2496573')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
