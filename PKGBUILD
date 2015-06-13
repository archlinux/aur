# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>

pkgname=python2-pyftpdlib
pkgver=1.4.0
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
md5sums=('5aeda8287f4e5ba263e48a79f2a246fd')

build() {
  cd "$srcdir/pyftpdlib-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyftpdlib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
