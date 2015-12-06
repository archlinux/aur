# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=('python-redmine' 'python2-redmine')
pkgbase='python-redmine'
pkgver=1.5.0
pkgrel=1
pkgdesc="Python library for communicating with a Redmine project management application"
arch=("any")
url="http://python-redmine.readthedocs.org/"
license=('Apache')
makedepends=('python' 'python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
md5sums=('743a6956ebe6ee3f1b5ee3f304e8f5c5')

prepare() {
  cp -a "${srcdir}/${pkgbase}-${pkgver}"{,-python2}
}

package_python-redmine() {
  depends=('python' 'python-requests')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-redmine() {
  depends=('python2' 'python2-requests')
  cd "$srcdir/$pkgbase-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
