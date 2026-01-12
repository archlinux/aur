# Maintainer: David Llorens <dllorens@uji.es>
pkgname=python-easypaint
pkgver=1.0.7
pkgrel=1
pkgdesc="Biblioteca de dibujo para Python 3 (requiere python-tk)"
arch=('any')
url="https://pypi.org/project/easypaint/"
license=('AGPL-3.0-or-later')
depends=('python>=3.8' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/e/easypaint/easypaint-${pkgver}.tar.gz")
sha256sums=('fcb6de48f8a8d441ee282a4c73f720ddee5206c1e41952519538d7eab860886a')

build() {
    cd "easypaint-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "easypaint-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
