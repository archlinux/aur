# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pywavelets
pkgver=0.2.2
pkgrel=1
pkgdesc="PyWavelets, wavelet transform module"
arch=('i686' 'x86_64')
url="http://www.pybytes.com/pywavelets/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'cython2' 'unzip')
options=(!emptydirs)

source=(http://pypi.python.org/packages/source/P/PyWavelets/PyWavelets-$pkgver.zip)
md5sums=('77d3528e59058935d23ff7e2f02c4968')

build() {
  cd "$srcdir"/PyWavelets-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/PyWavelets-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

