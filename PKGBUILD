# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.11.0
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('8212246c6b4d481e46ca77dddf2f2b88827b4cbb05253ebb8d170a2c3ab68fc7')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
