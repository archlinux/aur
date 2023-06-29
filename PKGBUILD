# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=2.13.2
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('991e531c4bb7dbec62b754878d96a3246338aac11a28ce3c3e99018fb2f5828c')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
