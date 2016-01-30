# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=pyFFTW
pkgname=python-pyfftw
pkgver=0.10.1
pkgrel=1
pkgdesc='A pythonic wrapper around FFTW.'
url='http://hgomersall.github.io/pyFFTW/'
depends=('fftw' 'python-numpy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('dab57de9d23f3b333115265914f3d240')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
