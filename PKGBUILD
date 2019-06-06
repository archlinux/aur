# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-kerasplotlib"
_pkgname="kerasplotlib"
pkgver=0.1.4
pkgrel=1
pkgdesc="Kerasplotlib provides a useful interface for Keras users that meet many common visualization needs related with training and evaluating deep learning models."
arch=('any')
url="https://github.com/autonomio/kerasplotlib"
license=('MIT')
depends=('python' 'python-keras' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/e8/2e/b8628bfef6a817da9be863f650cf67187676b10d27d94b23f248da35d2b4/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bb76dc6f03def4b0d07ea7235b8111b7eba24d2a29047e3faaebe03ec4e45f22')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
