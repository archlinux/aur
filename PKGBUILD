# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pywavelets
_pkgname=pywt
pkgver=0.3.0
pkgrel=1
pkgdesc="Discrete Wavelet Transforms in Python"
arch=('any')
url="https://github.com/PyWavelets/pywt"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-nose')
source=(https://github.com/PyWavelets/pywt/archive/v$pkgver.tar.gz)
sha256sums=('9a82d86588220ae3744e09ead7a52169b4f0363b78fdb3b361a90d6cda7acc31')

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
