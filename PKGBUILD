pkgname=python-ocpsvg
pkgdesc="Python library to convert between OCP and SVG"
pkgver=0.6.0
pkgrel=2
arch=('any')
url="https://github.com/snoyer/ocpsvg"
license=('MIT')
depends=('python-ocp>=7.8.1' 'python-svgelements')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/ocpsvg/ocpsvg-$pkgver.tar.gz")
sha256sums=('f08da4347cc90ecd3565395e9bda5746d46ab8aafd6a2681bb03a9c321b54039')

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
