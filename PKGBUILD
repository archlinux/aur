# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=2.14.1
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('1ac31c333a0d83c88831523245500caa814503423741b0e465339ef6da5b5e29')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
