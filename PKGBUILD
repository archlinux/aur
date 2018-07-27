# 2018 - Erick Pires <rckkas@gmail.com>
pkgname=python-minervaboto
pkgver=1.0.4
pkgrel=1
pkgdesc="A renewal tool for Acervo Minerva"
arch=('any')
makedepends=('python-setuptools')
depends=( 'python-requests' 'python-beautifulsoup4' 'python-appdirs')
url="https://github.com/erickpires/minervaboto"
license=('MIT')
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('06f13769eca9a16708843db94312d224')

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
