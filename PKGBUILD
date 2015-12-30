# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pywavelets
_pkgname=pywt
pkgver=0.4.0
pkgrel=1
pkgdesc="Discrete Wavelet Transforms in Python"
arch=('any')
url="https://github.com/PyWavelets/pywt"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-nose')
source=(https://github.com/PyWavelets/pywt/archive/v$pkgver.tar.gz)
sha256sums=('4d0b852a8bb953f2fc3d735b191191c225d5bf0c825294cea130b2366f2a38ad')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -u runtests.py -g -m full --coverage
  #nosetests3
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
