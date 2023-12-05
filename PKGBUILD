# Contributor: Patrick Mischke

pkgname='python-glumpy'
_name='glumpy'
pkgver=1.2.1
pkgrel=1
pkgdesc="python library for scientific visualization, interfacing numpy and OpenGL"
url="https://github.com/glumpy/glumpy"
depends=('cython' 'python-numpy' 'python-triangle' 'python-opengl')
license=('BSD')
arch=('any')
source=("https://github.com/glumpy/glumpy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5667fbfec6ac380aabe38b428360e605e831b707a81aab07ff1093ece88e8a9e') 

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
