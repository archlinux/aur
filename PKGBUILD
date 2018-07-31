# 2018 - Erick Pires <rckkas@gmail.com>
pkgname=python-minervaboto
pkgver=1.1.2
pkgrel=1
pkgdesc="A renewal tool for Acervo Minerva"
arch=('any')
makedepends=('python-setuptools')
depends=( 'python-requests' 'python-beautifulsoup4' 'python-appdirs')
url="https://github.com/erickpires/minervaboto"
license=('MIT')
# https://pypi.python.org/packages/source/m/minervaboto/minervaboto-1.1.x.tar.gz
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('d20a5a925b5099cd253be0990c87bb6e')

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
