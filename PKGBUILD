_pkgname=wand
pkgname=python-wand
pkgver=0.4.2
pkgrel=1
pkgdesc="Ctypes-based simple MagickWand API binding for Python"
arch=('any')
url="http://wand-py.org/"
license=('MIT')
depends=('python' 'python-setuptools')
source=("https://github.com/dahlia/wand/archive/${pkgver}.tar.gz")
md5sums=('d88120429d100fca7a7554f0f4d56ce9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
  rm $pkgdir/usr/README.rst
}
