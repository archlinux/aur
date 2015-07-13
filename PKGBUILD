# Maintainer: Glennie Vignarajah <glennie@glennie.fr>

pkgname=python-robobrowser
pkgver=0.5.3
pkgrel=1
pkgdesc="RoboBrowser is a simple, Pythonic library for browsing the web without a standalone web browser."
arch=('any')
url="https://github.com/jmcarp/robobrowser"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-pip' 'python-werkzeug' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("http://pypi.python.org/packages/source/r/robobrowser/robobrowser-$pkgver.tar.gz")
md5sums=('333ad401f4a0b320fa873c78bc5fb64d')


prepare() {
  cd "$srcdir/robobrowser-$pkgver"
  python setup.py build --quiet
}

check() {
  cd "$srcdir/robobrowser-$pkgver"
  #python setup.py test -q
}

package() {
  cd "$srcdir/robobrowser-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
