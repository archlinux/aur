# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-kerasplotlib"
_pkgname="kerasplotlib"
pkgver=0.1.6
pkgrel=1
pkgdesc="Kerasplotlib provides a useful interface for Keras users that meet many common visualization needs related with training and evaluating deep learning models."
arch=('any')
url="https://github.com/autonomio/kerasplotlib"
license=('MIT')
depends=('python' 'python-keras' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/7b/b7/31663d3b5ea9afd8c2c6ffa06d3c4e118ef363e12dc75b7c49fb6a2d22aa/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('794791ddbcf089901cf91ecd11bd64c07a430595d53fc0e46b5e59a710f3d57b')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
