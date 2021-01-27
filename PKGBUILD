# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-talos"
_pkgname="talos"
pkgver=1.0
pkgrel=1
pkgdesc="Talos radically changes the ordinary Keras workflow by fullyautomating hyperparameter tuning and model evaluation. Talos exposes Keras functionality entirely and there is no new syntax or templates to learn."
arch=('any')
url="https://github.com/autonomio/talos/"
license=('MIT')
depends=('python' 'python-tensorflow' 'python-keras' 'python-numpy' 'python-pandas' 'python-scikit-learn' 'python-tqdm' 'python-requests' 'python-wrangle' 'python-chances' 'python-astetik' 'python-kerasplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/cb/e0/f1c46e0fea1898aed80d34ee0e3d3cf7d055b564aa4f84a058116c8adec1/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('019d2e161d5851e8496cb0861e006cfef44f810250be25fac60a811cf78d9758')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
