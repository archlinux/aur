# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.12.1
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('6036e8915180be9803dc1ac9ccf0a9962deecd34b22f3d52be0f4d2c786e8383')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
