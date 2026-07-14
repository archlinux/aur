pkgname=python-iraqitext
pkgver=0.1.0
pkgrel=1
pkgdesc="Translate Iraqi dialect to Modern Standard Arabic and back"
arch=('any')
url="https://pypi.org/project/iraqitext/"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/i/iraqitext/iraqitext-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/iraqitext-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/iraqitext-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
