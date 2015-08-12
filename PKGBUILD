# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pywavelets
pkgver=0.3.0
pkgrel=1
pkgdesc="PyWavelets, wavelet transform module"
arch=('i686' 'x86_64')
url="http://pywavelets.readthedocs.org/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'cython2' 'unzip')
options=(!emptydirs)

source=(http://pypi.python.org/packages/source/P/PyWavelets/PyWavelets-$pkgver.zip)
md5sums=('b7f01bf7d8dff25d470d3deb3d5a9d0f')

build() {
  cd "$srcdir"/PyWavelets-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/PyWavelets-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

