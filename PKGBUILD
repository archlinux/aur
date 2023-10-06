# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=2.14.0
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('e03ef2d131fbb4371b4018718452ce8c735a48edfe0139d2abdce4c187a459c3')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
