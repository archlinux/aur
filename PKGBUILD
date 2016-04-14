# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
_name=colorama
pkgname=python2-colorama-0.3.3
pkgver=0.3.3
pkgrel=2
pkgdesc='Python API for cross-platform colored terminal text.'
arch=('any')
url="http://pypi.python.org/pypi/colorama"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
provides=("python2-colorama=$pkgver")
conflicts=('python2-colorama')
source=("https://pypi.python.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
md5sums=('a56b8dc55158a41ab3c89c4c8feb8824')


build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_name-$pkgver/LICENSE.txt"	
}

# vim:set ts=2 sw=2 et:
