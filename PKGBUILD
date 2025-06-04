pkgname=python-ocpsvg
pkgdesc="Python library to convert between OCP and SVG"
pkgver=0.5.0
pkgrel=1
arch=('any')
url="https://github.com/snoyer/ocpsvg"
license=('MIT')
depends=('python-ocp>=7.8.1' 'python-svgelements')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/ocpsvg/ocpsvg-$pkgver.tar.gz")
sha256sums=('5cd8dbec8bf590d373a82aaebeab241838185aab04ee2859f33b9d7956bbfba6')

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
