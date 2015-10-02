# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=pyFFTW
pkgname=python-pyfftw
pkgver=0.9.2
pkgrel=1
pkgdesc='A pythonic wrapper around FFTW.'
url='http://hgomersall.github.io/pyFFTW/'
depends=('fftw' 'python-numpy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('34fcbc68afb8ebe5f040a02a8d20d565')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
