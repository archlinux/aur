# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgbase=python-debian
pkgname=('python-debian' 'python2-debian')
pkgver=0.1.29
pkgrel=1
pkgdesc="Python modules to work with Debian-related data formats"
arch=('any')
url="http://packages.debian.org/sid/python-debian"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$pkgbase/${pkgbase}_$pkgver.tar.xz)
sha256sums=('932c81517a75fb4a86944b247b136895b08bbb010c28631c25afdf006d8b3373')

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
