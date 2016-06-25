# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-pywavelets
_pkgname=pywt
pkgver=0.4.0
pkgrel=1
pkgdesc="Discrete Wavelet Transforms in python2"
arch=('any')
url="https://github.com/PyWavelets/pywt"
license=('MIT')
depends=('python2' 'python2-numpy')
makedepends=('python2-setuptools' 'cython')
checkdepends=('python2-nose')
source=(https://github.com/PyWavelets/pywt/archive/v$pkgver.tar.gz)
sha256sums=('4d0b852a8bb953f2fc3d735b191191c225d5bf0c825294cea130b2366f2a38ad')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 -u runtests.py -g -m full --coverage
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
