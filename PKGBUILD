# 2018 - Erick Pires <rckkas@gmail.com>
pkgname=python-minervaboto
pkgver=1.0.6
pkgrel=1
pkgdesc="A renewal tool for Acervo Minerva"
arch=('any')
makedepends=('python-setuptools')
depends=( 'python-requests' 'python-beautifulsoup4' 'python-appdirs')
url="https://github.com/erickpires/minervaboto"
license=('MIT')
# https://pypi.python.org/packages/source/m/minervaboto/minervaboto-1.0.x.tar.gz
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('49008529bd62c8993e90705d60fb8acd')

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
