# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>

pkgname=python2-pyftpdlib
pkgver=1.5.1
pkgrel=1
pkgdesc="Complete asynchronous FTP server library in Python"
arch=('any')
url='http://pyftpdlib.googlecode.com'
license=('MIT')
depends=('python2')
optdepends=("python2-sendfile: used to speedup transfers"
            "python2-pyopenssl: used for SSL support")
conflicts=('pyftpdlib')
source=("https://pypi.python.org/packages/source/p/pyftpdlib/pyftpdlib-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/a8/f8/0f6db156898616dbcbd7bf865660295c81479071ab0fcd1898fe1b3a4fc4/${pkgname/python2-/}-${pkgver}.tar.gz")
md5sums=('61b23e2362df23d0dfa5fe76f6e2ab55')

build() {
  cd "$srcdir/pyftpdlib-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyftpdlib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
