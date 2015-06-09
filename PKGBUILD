# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-socksipy-branch
pkgver=1.01
pkgrel=1
pkgdesc="Allows you to create TCP connections through a SOCKS proxy without any special effort"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://code.google.com/p/socksipy-branch/"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/S/SocksiPy-branch/SocksiPy-branch-$pkgver.tar.gz)
md5sums=('a59e29647320211202ce79b0cf873106')
sha256sums=('17a95060e28c3b9038a9b8c1865c54f8c1c5bef15d561bf777c9bbf3c80e8406')

build() {
  cd "$srcdir/SocksiPy-branch-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/SocksiPy-branch-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
