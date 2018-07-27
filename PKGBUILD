# 2018 - Erick Pires <rckkas@gmail.com>
pkgname=python-minervaboto
pkgver=1.0.1
pkgrel=1
pkgdesc="A renewal tool for Acervo Minerva"
arch=('any')
makedepends=('python-setuptools')
url="https://github.com/erickpires/minervaboto"
license=('MIT')
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('1a19cc37201d03ffcb4701d57b04bbee')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
