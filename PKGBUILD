# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=pyFFTW
pkgname=("python-pyfftw" "python2-pyfftw")
pkgbase="python-pyfftw"
pkgver=0.10.4
pkgrel=1
pkgdesc='A pythonic wrapper around FFTW.'
url='http://hgomersall.github.io/pyFFTW/'
depends=('fftw' 'python-numpy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('7fb59450308881bb48d9f178947d950e')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build_ext --inplace
  python setup.py test
}

package_python-pyfftw() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyfftw() {
  cd $srcdir/$_pyname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
