# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-imbalanced-learn"
_pkgname="imbalanced-learn"
pkgver=0.4.3
pkgrel=1
pkgdesc="imbalanced-learn is a python package offering a number of re-sampling techniques commonly used in datasets showing strong between-class imbalance."
arch=('any')
url="https://github.com/scikit-learn-contrib/imbalanced-learn"
license=('MIT')
depends=('python' 'python-scipy' 'python-numpy' 'python-scikit-learn')
optdepends=('python-keras' 'python-tensorflow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/4f/4d/e260fc004307d6ebc4909ee25e6c918a2399a7fb91975afd95ec48d1c8b4/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5bd9e86e40ce4001a57426541d7c79b18143cbd181e3330c1a3e5c5c43287083')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
