# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=2.14.2
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('e956bf8988d07a06ba3305f6604e261f4ca014c4a232f0873f1c7692fbe3cfc2')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
