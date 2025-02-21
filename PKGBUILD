pkgname=python-ocpsvg
pkgdesc="Find all the sides and angles of a triangle"
pkgver=0.4.0
pkgrel=1
arch=('any')
url="https://github.com/snoyer/ocpsvg"
license=('MIT')
depends=('python-ocp>=7.8.1' 'python-svgelements')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/ocpsvg/ocpsvg-$pkgver.tar.gz")
sha256sums=('5155d70593e883b35b1de06ba0fa1cc39c5edea26c25a663243b475ce9987aa6')

build() {
    cd ocpsvg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ocpsvg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd ocpsvg-$pkgver
    pytest
}
