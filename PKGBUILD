#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=p5
pkgname=python-$_pkgname
pkgver=0.7.1
pkgrel=1
pkgdesc="Python package based on the core ideas of Processing"
url="https://github.com/p5py/p5"
arch=('any')
license=('GPL3')
depends=('python' 'glfw' 'python-numpy' 'python-vispy' 'python-triangle')
provides=("python-p5")
options=(!emptydirs)
source=("https://github.com/p5py/${_pkgname}/archive/v${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/p5py/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('b45842cbe9ab113385c4a2eeca2bf4fd19002be6aee0c294dfc14860bce9b39f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

