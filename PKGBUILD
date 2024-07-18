# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=2.15.0
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")
sha256sums=('0a13a43816f46cf084657fb05596823b93d5b48e75ef7763c8a756ec1217837a')

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
