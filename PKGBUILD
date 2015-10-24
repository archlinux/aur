# Maintainer: maz-1 <ohmygod19993 at gmail>
pkgname=python2-pygubu
pkgver=0.9.7.7
pkgrel=1
pkgdesc="A simple GUI designer for the python tkinter module. For python2."
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'tk' 'python2-appdirs')
source=("https://github.com/alejandroautalan/pygubu/archive/v${pkgver}.tar.gz")
md5sums=('cb2e83f926c0126b097089ca96a1d29a')

build() {
  cd "$srcdir/pygubu-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pygubu-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  cd "${pkgdir}/usr/bin"
  mv pygubu-designer pygubu-designer-py2
}
