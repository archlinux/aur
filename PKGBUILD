# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-aniso8601
pkgver=1.3.0
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python' 'python-dateutil')
makedepends=('python-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/07/2e/63316d28874c0207de3dbb85cca21a1dd7be06082952a907a7638311a925/aniso8601-1.3.0.tar.gz)
md5sums=('d3c987293e4b5acf2004edf48cd19e9f')
sha256sums=('c3b5246f5601b6ae5671911bc4ee5b3e3fe94752e8afab5ce074d8b1232952f1')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
