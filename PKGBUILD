# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-nomad
pkgver=2.1.0
pkgrel=1
pkgdesc="Client library for Hashicorp Nomad"
arch=('any')
url="http://github.com/jrxfive/python-nomad"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('53e6d9ec6f66b672ae9d6d03591a24be2d8b5450dd7fdbe1003831cb9b77f847')

build() {
    cd "python_nomad-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "python_nomad-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
