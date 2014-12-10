# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgbase=python-debian
pkgname=('python-debian' 'python2-debian')
pkgver=0.1.24
pkgrel=2
pkgdesc="Python modules to work with Debian-related data formats"
arch=('any')
url="http://packages.debian.org/sid/python-debian"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$pkgbase/${pkgbase}_$pkgver.tar.xz)
sha256sums=('da36ac47d8b929af12d6889c974159e00c9f7372b84041b6663bb9114e83b854')

package_python-debian() {
  depends=(python-chardet python-six)
  optdepends=("python-apt: interface to libapt-pkg")
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-debian() {
  depends=(python2-chardet python2-six)
  optdepends=("python2-apt: interface to libapt-pkg")
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
