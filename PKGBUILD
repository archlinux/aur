# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.13.1
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('a44736830741e2bb9c4e3992819288b77ac4af217a46d12f415bb57c18ed9c22')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
