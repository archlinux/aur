# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-imbalanced-learn"
_pkgname="imbalanced-learn"
pkgver=0.7.0
pkgrel=1
pkgdesc="imbalanced-learn is a python package offering a number of re-sampling techniques commonly used in datasets showing strong between-class imbalance."
arch=('any')
url="https://github.com/scikit-learn-contrib/imbalanced-learn"
license=('MIT')
depends=('python' 'python-scipy' 'python-numpy' 'python-scikit-learn')
optdepends=('python-keras' 'python-tensorflow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/3e/c1/2a1b332589b3e668a560c0cb00d98c204ece60f178a0dbde4e2165194ce7/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('da59de0d1c0fa66f62054dd9a0a295a182563aa1abbb3bf9224a3678fcfe8fa4')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
