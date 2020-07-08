# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

_pkgbase=aiormq
pkgname=python-${_pkgbase}
pkgver=3.2.2
pkgrel=1
pkgdesc="Pure python AMQP 0.9.1 asynchronous client library"
arch=('any')
url="http://github.com/mosquito/aiormq"
license=('Apache')
depends=('python' 'python-pamqp' 'python-yarl')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgbase:0:1}/$_pkgbase/$_pkgbase-${pkgver}.tar.gz")
sha256sums=('7c19477a9450824cb79f9949fd238f4148e2c0dca67756a2868863c387209f04')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
