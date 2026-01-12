# Maintainer: David Llorens <dllorens@uji.es>
pkgname=python-algoritmia
pkgver=4.0.6
pkgrel=1
pkgdesc="A library of algorithms and data structures for course EI1022/MT1022 (UJI)"
arch=('any')
url="https://github.com/DavidLlorens/algoritmia"
license=('AGPL-3.0-or-later')
depends=('python>=3.12' 'python-easypaint')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/a/algoritmia/algoritmia-${pkgver}.tar.gz")
sha256sums=('c38b26ef3d360e1dc0fdd667acf8189ae785d97b0da4fbddae96465952108dcf')

build() {
    cd "algoritmia-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "algoritmia-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
