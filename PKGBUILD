# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_name=aniso8601
pkgname=python2-$_name
pkgver=1.3.0
pkgrel=2
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python2' 'python2-dateutil')
makedepends=('python2-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('d3c987293e4b5acf2004edf48cd19e9f')
sha256sums=('c3b5246f5601b6ae5671911bc4ee5b3e3fe94752e8afab5ce074d8b1232952f1')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
