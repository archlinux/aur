pkgname=python-iraqitext
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight NLP for the Iraqi Arabic dialect: translation, morphology, tokenization and dialect detection"
arch=('any')
url="https://pypi.org/project/iraqitext/"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/i/iraqitext/iraqitext-${pkgver}.tar.gz")
sha256sums=('43e058ec520b9512e25cd2ccf9ed64fcf36857c9376e050f6a67164cc2591fb0')

build() {
    cd "$srcdir/iraqitext-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/iraqitext-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
