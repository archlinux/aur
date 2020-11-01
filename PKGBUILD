# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgbase=python-debian
pkgname=('python-debian' 'python2-debian')
pkgver=0.1.38
pkgrel=1
pkgdesc="Python modules to work with Debian-related data formats"
arch=('any')
url="https://salsa.debian.org/python-debian-team/python-debian"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=(http://deb.debian.org/debian/pool/main/p/$pkgbase/${pkgbase}_$pkgver.tar.xz)
sha256sums=('bc8862111d0b45f5c2242f365651b392b056893d41a55799cf7e9eaad3b81f5d')

package_python-debian() {
  depends=(python-chardet python-six)
  optdepends=("python-apt: interface to libapt-pkg")
  cd "$srcdir/$pkgbase-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-debian() {
  depends=(python2-chardet python2-six)
  optdepends=("python2-apt: interface to libapt-pkg")
  cd "$srcdir/$pkgbase-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
