# 2018 - Erick Pires <rckkas@gmail.com>
pkgname=python-minervaboto
pkgver=1.1.1
pkgrel=1
pkgdesc="A renewal tool for Acervo Minerva"
arch=('any')
makedepends=('python-setuptools')
depends=( 'python-requests' 'python-beautifulsoup4' 'python-appdirs')
url="https://github.com/erickpires/minervaboto"
license=('MIT')
# https://pypi.python.org/packages/source/m/minervaboto/minervaboto-1.1.x.tar.gz
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('53d03d01ea2723f1fb9e5da578832281')

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
