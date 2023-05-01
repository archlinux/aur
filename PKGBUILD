#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=p5
pkgname=python-$_pkgname
pkgver=0.8.2
pkgrel=1
pkgdesc="Python package based on the core ideas of Processing"
url="https://github.com/p5py/p5"
arch=('any')
license=('GPL3')
depends=('python' 'glfw' 'python-freetype-py' 'python-numpy' 'python-vispy' 'python-triangle' 'python-pillow' 'python-opengl' 'python-opengl-accelerate' 'python-requests' 'python-dataclasses' 'python-skia')
provides=("python-p5")
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/p5py/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('e569097348997ae4efa5659b4b81a357426c89c2f8feaf3ebd5731c266daf133')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

